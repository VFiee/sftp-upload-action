#! /bin/sh

set -eu

SSH_PRIVATE_KEY_FILE='../private_key.pem'
SFTP_FILE='../sftp'

# 输入私钥到文件
printf "%s" "$3" >$SSH_PRIVATE_KEY_FILE

# 保持私钥只读性
chmod 600 $SSH_PRIVATE_KEY_FILE


echo 'sftp upload start'

# 创建stfp批处理文件
printf "%s" "put -r $5 $6" > $SFTP_FILE

# -o StrictHostKeyChecking=no
sftp -b $SFTP_FILE -P $4 -i $SSH_PRIVATE_KEY_FILE $1@$2

echo 'deploy success'

exit 0