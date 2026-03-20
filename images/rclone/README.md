# rclone

Custom rclone image with `fuse3` support and automatic mountpoint cleanup on startup.

## Additional Features

- `fuse3` installed for FUSE mount support
- Automatic `fusermount3` cleanup before mounting, preventing stale mount errors on restart

## Environment Variables

| Variable | Description | Required |
|---|---|---|
| `RCLONE_MOUNT_PATH` | Path to unmount before starting rclone | No |

If `RCLONE_MOUNT_PATH` is not set, the image behaves identically to the official `rclone/rclone` image.