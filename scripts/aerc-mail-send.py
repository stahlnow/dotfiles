#!/usr/bin/env python
import subprocess
import sys
import tempfile

# read message from stdin
message = sys.stdin.read()

# replace content-type
# message = message.replace(
#     "Content-Type: text/plain; charset=UTF-8",
#     "Content-Type: text/html; charset=UTF-8",
#     1,
# )

# save mail to tmp folder
with tempfile.NamedTemporaryFile(
    "w+t",
    suffix=".eml",
    delete=False,
) as fp:
    fp.write(message)


# send mail with msmtp
try:
    proc = subprocess.run(
        [
            "/usr/bin/msmtp",
            "--read-recipients",
            "--read-envelope-from",
        ],
        input=message,
        text=True,
        check=True,
        capture_output=True,
    )
    sys.exit(proc.returncode)
except subprocess.CalledProcessError as exc:
    print(f"An error occurred: {exc.stderr.strip()}. Exit ({exc.returncode})")
    sys.exit(exc.returncode)
