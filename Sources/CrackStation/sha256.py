import hashlib
import string
import json
import itertools
# using string package to get the list of alphabets and numbers
alphanumeric=list(string.ascii_lowercase)+list(string.ascii_uppercase)+list(string.digits)+["?"]+["!"]
['abcdefghijk...z']+['ABC....']+['123..90']
two_letter_words = [''.join(i) for i in itertools.product(alphanumeric, repeat = 2)]
three_letter_words = [''.join(i) for i in itertools.product(alphanumeric, repeat = 3)]
keywords=alphanumeric+two_letter_words+three_letter_words

# appending the hash function 
final_dict={}
for i in keywords:
     x=bytes(i,"utf-8")
     hash=hashlib.sha1(x)
     final_dict[hash.hexdigest()]=i
for i in keywords:
     x=bytes(i,"utf-8")
     hash=hashlib.sha256(x)
     final_dict[hash.hexdigest()]=i
print(len(final_dict))


# converting the acquired cancatenated dictionary to json format
jason = json.dumps(final_dict)

with open("data.json","w") as wr:
     wr.write(jason)
    