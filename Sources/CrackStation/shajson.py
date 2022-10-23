import hashlib
import string
import json 



no='0123456789' # storing 0 to 9 numbers
sm=list(string.ascii_lowercase) # storing a-z in a string sm
cap=list(string.ascii_uppercase) # storing A-Z in a string cap
smd={}
capd={}
nod={}
smhash,chash,nhash=[],[],[]
for i in no:
  i=bytes(i,'utf8')
  a = hashlib.sha1()
  a.update(i)
  nhash.append(a.hexdigest())
for i in sm:
  i=bytes(i,'utf8')
  a = hashlib.sha1()
  a.update(i)
  smhash.append(a.hexdigest())
for i in cap:
  i=bytes(i,'utf8')
  a = hashlib.sha1()
  a.update(i)
  chash.append(a.hexdigest())

for i in range(len(sm)):
    smd[smhash[i]]=sm[i]
    capd[chash[i]]=cap[i]
for i in range(len(no)):
    nod[nhash[i]]=no[i]
lastd = {**smd, **capd, **nod}

json_object = json.dumps(lastd)
 

with open("sha.json", "w") as final:
    final.write(json_object)