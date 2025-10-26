from enum import Enum
import boto3
import time

from kernel import LOG_STREAM_NAME_CANDIDATE, LOG_STREAM_NAME_RECRUITER, LOG_STREAM_NAME_SYSTEM, LOG_GROUP_NAME


class LogLevel(Enum):
    NOTSET = 0
    DEBUG = 10
    INFO = 20
    WARN = 30
    ERROR = 40
    CRITICAL = 50

class LogTarget(Enum):
    SYSTEM = 0
    CANDIDATE = 10
    RECRUITER = 20

cloudwatch_logs = boto3.client('logs')


def write(message, level : LogLevel = LogLevel.INFO, target : LogTarget= LogTarget.CANDIDATE):
    if target == LogTarget.CANDIDATE:
        log_stream_name = LOG_STREAM_NAME_CANDIDATE
    elif target == LogTarget.RECRUITER:
        log_stream_name = LOG_STREAM_NAME_RECRUITER
    else:
        log_stream_name = LOG_STREAM_NAME_SYSTEM

    timestamp = int(time.time() * 1000)
    log_event = {
        'timestamp': timestamp,
        'message': f"[{level}] {message}"
    }
    cloudwatch_logs.put_log_events(
        logGroupName=LOG_GROUP_NAME,
        logStreamName=log_stream_name,
        logEvents=[log_event]
    )