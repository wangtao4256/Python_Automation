__author__ = 'KD'
# -*- coding:utf-8 -*-
#!/usr/bin/python

from cryptography.fernet import Fernet

def getcipher():
    cipher_key = b'PabcRCgkFXUu5aT1il_VFA9kpUCq8VwnebWf9fCbqvQ='
    cipher = Fernet(cipher_key)
    return cipher
def encrypt(content):
    cipher = getcipher()
    content = bytes(content)
    encrypted_content = cipher.encrypt(content)
    return encrypted_content

def decrypt(content):
    cipher = getcipher()
    #content = bytes(content,encoding="utf8")
    decrypted_content = cipher.decrypt(content)
    return decrypted_content

# if __name__ == '__main__':
#     content = b"test"
#     ency = encrypt(content)
#     decy = decrypt(ency)

if __name__ == '__main__':
    content = b'gpadmin'
    ency = encrypt(content)
    print(ency)
    decy = decrypt(b'gAAAAABZAtzsYOPoxL2KyCESsj7et-CMRt7oSpSp7gymbJ13k4bLbPJBlaDYBQfCToLrML14XqzazxKr8Pamu0mhftrY0CPISg==')
    print(decy)