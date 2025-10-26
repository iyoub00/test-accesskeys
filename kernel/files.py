from hashlib import shake_128

import boto3
from botocore.exceptions import ClientError
import os

from entity.candidate import Candidate
from entity.offer import Offer
from entity.organization import Organization
from kernel import logs, BUCKET_NAME
from kernel.logs import LogLevel, LogTarget

s3 = boto3.client('s3') # os.environ.get("BUCKET_NAME")
ALLOWED_EXTENSIONS = {'doc', 'docx', 'pdf'}
UPLOAD_FOLDER = "uploads"

def upload_file(file,org_id, org_name,collection_id,collection_name,offer_id, candidate_full_name):
    """Upload a file to an S3 bucket

    :param file: File object from the request object => file = request.files['myFile']
    :param org_id: Organization ID
    :param org_name: Organization name
    :param collection_id: Collection ID
    :param collection_name: Collection name
    :param offer_id: Offer ID
    :param candidate_full_name: Firstname_Lastname
    :return: ObjectName if file was uploaded, else empty string ""
    """
    if not file or file.filename == '':
        logs.write("No selected file", LogLevel.ERROR, LogTarget.SYSTEM)
        return ""

    if not allowed_file(file.filename):
        logs.write("File extension not allowed", LogLevel.ERROR, LogTarget.SYSTEM)

    final_file = ''

    # Upload the file
    try:
        file_ext = file.filename.rsplit('.', 1)[1].lower()
        original_file_name = file.filename.rsplit('.', 1)[0]
        digested_file_name = shake_128(original_file_name.encode('utf-8')).hexdigest(25)
        print(digested_file_name)
        final_file_name = UPLOAD_FOLDER+'/'+digested_file_name+"."+file_ext
        file.save(final_file_name)
        f = open(final_file_name, 'rb')
        ff = f.read()
        # Let's use Amazon S3
        final_file = candidate_full_name+'_'+digested_file_name+"."+file_ext
        folder = 'cvs/'+org_name+'_'+org_id+'/'+collection_name+'_'+collection_id+'/'+offer_id+'/'
        obj_name = folder+final_file
        obj = s3.Object(BUCKET_NAME, obj_name)
        obj.put(Body=ff)
    except ClientError as e:
        logs.write(e, LogLevel.ERROR, LogTarget.SYSTEM)
        return ""
    return final_file


def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS