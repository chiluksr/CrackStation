import hashlib
import string
import json 
import itertools



no='0123456789' # storing 0 to 9 numbers
sm=list(string.ascii_lowercase) # storing a-z in a string sm
cap=list(string.ascii_uppercase) # storing A-Z in a string cap
all_letters =sm+cap+list(no)
words=[''.join(words) for words in itertools.product(all_letters,repeat=2)]
smhash,chash,nhash,wordshash=[],[],[],[]
words_dict={}
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
for i in words:
  i=bytes(i,'utf-8')
  a=hashlib.sha1()
  a.update(i)
  wordshash.append(a.hexdigest())
for i in range(len(sm)):
    words_dict[smhash[i]]=sm[i]
    words_dict[chash[i]]=cap[i]
for i in range(len(no)):
    words_dict[nhash[i]]=no[i]
for i in range(len(words)):
  words_dict[wordshash[i]]=words[i]




json_object = json.dumps(words_dict)
 

with open("sha.json", "w") as final:
    final.write(json_object)