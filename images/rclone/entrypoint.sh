#!/bin/sh
if [ -n "$RCLONE_MOUNT_PATH" ]; then
    fusermount3 -uz "$RCLONE_MOUNT_PATH" 2>/dev/null || true
fi
exec rclone "$@"