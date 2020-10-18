#!/bin/python
import json
import requests
import sys

r=requests.get('http://169.254.169.254/latest/dynamic/instance-identity/document')
data=r.json()
print("The foolowing is the list of key of metadata of AWS instance")
for k in data:
        print(k)
name="yes"
while name != "exit":
        name = input("Enter any key from the above list or Enter All for show metadata in json format or Enter exit to close ")
        if name=="All":
                print(data)
        else:
                for k in data:
                        if k==name:
                                print(data[k])


                print("Enter correct key")
