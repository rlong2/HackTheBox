
# Admin content
```
sensitive_information> show dbs
admin                  32.00 KiB
config                 72.00 KiB
local                  72.00 KiB
sensitive_information  32.00 KiB
users                  32.00 KiB

sensitive_information> use admin
switched to db admin
admin> show collections
system.version
admin> system.version.find().pretty()
ReferenceError: system is not defined
admin> db.system.version.find().pretty()
[ { _id: 'featureCompatibilityVersion', version: '3.6' } ]
```
# Config content
```
admin> use config
switched to db config
config> show collections
system.sessions
config> db.system.sessions.find().pretty()
[
  {
    _id: {
      id: UUID('6848e05b-dc69-4352-911d-0dc6337aec14'),
      uid: Binary.createFromBase64('47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=', 0)
    },
    lastUse: ISODate('2025-08-06T12:42:10.870Z')
  },
  {
    _id: {
      id: UUID('6c273f89-8ad7-4f8b-a9ed-5dfe14f400f0'),
      uid: Binary.createFromBase64('47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=', 0)
    },
    lastUse: ISODate('2025-08-06T12:42:10.870Z')
  },
  {
    _id: {
      id: UUID('bc264632-af9f-40bc-9a37-f761b473b208'),
      uid: Binary.createFromBase64('47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=', 0)
    },
    lastUse: ISODate('2025-08-06T12:42:10.870Z')
  }
]

```
# Users
```
local> use users
switched to db users
users> show collections
ecommerceWebapp
users> db.ecommerceWebapp.find().pretty()
[
  {
    _id: ObjectId('630e4432b82540ebbd1748c6'),
    id: 1,
    username: 'Ryley',
    email: 'vheathcote@example.net',
    createdAt: '2019-07-17',
    password: 'fff4b345de2aee9f1fa5e2a44b3b03378b189d1e'
  },
  {
    _id: ObjectId('630e4454b82540ebbd1748c7'),
    id: 2,
    username: 'Bertha',
    email: 'astreich@example.net',
    createdAt: '1976-02-18',
    password: '085ed623db4b520f59ab1b6b6d222eea94ceb4cb'
  },
  {
    _id: ObjectId('630e445cb82540ebbd1748c8'),
    id: 3,
    username: 'Maximillian',
    email: 'trent.carroll@example.org',
    createdAt: '2005-08-26',
    password: '3859489a17b1cf46251aca8984af8da43356e496'
  },
  {
    _id: ObjectId('630e446cb82540ebbd1748c9'),
    id: 4,
    username: 'Giuseppe',
    email: 'bernadine81@example.com',
    createdAt: '2009-03-31',
    password: 'cb4a1ed66f998facd1a39b32f0f1ee698ee7e166'
  },
  {
    _id: ObjectId('630e4475b82540ebbd1748ca'),
    id: 5,
    username: 'Darrell',
    email: 'pblanda@example.org',
    createdAt: '1986-04-10',
    password: '6fd69f347d34d5dacd62f45851c4052a69ef8a94'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d0'),
    id: 6,
    username: 'itrantow',
    email: 'boyer.elna@example.com',
    createdAt: '1975-04-28',
    password: 'e5f81b290486127cdb76133ecb7d9b1d'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d1'),
    id: 7,
    username: 'mayra34',
    email: 'lferry@example.org',
    createdAt: '1997-05-14',
    password: '03a8f2ef52750aa1f257817198f2d9d1'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d2'),
    id: 8,
    username: 'hahn.maritza',
    email: 'klubowitz@example.com',
    createdAt: '2019-03-06',
    password: 'ef6b43e3406e5cd3d6165d104885d6f3'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d3'),
    id: 9,
    username: 'cremin.eliza',
    email: 'mgutkowski@example.org',
    createdAt: '2006-03-09',
    password: 'e4d416c0d0e2c39e234538487bd4a90f'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d4'),
    id: 10,
    username: 'jazmyne.raynor',
    email: 'uwisoky@example.com',
    createdAt: '1971-08-28',
    password: '6a7e8382202666495e7af9e8c4eeae01'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d5'),
    id: 11,
    username: 'jon68',
    email: 'waters.weston@example.org',
    createdAt: '1999-07-07',
    password: 'e8c1edfcd54021b2952dc9441492176f'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d6'),
    id: 12,
    username: 'ifunk',
    email: 'eino52@example.net',
    createdAt: '2022-08-06',
    password: 'e1e5a4399b6ab48fc6ca314b84874f66'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d7'),
    id: 13,
    username: 'evalyn27',
    email: 'jason36@example.net',
    createdAt: '2002-03-04',
    password: '20bac8efa1198ff21fa7030fa3f43223'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d8'),
    id: 14,
    username: 'zella.muller',
    email: 'kolby25@example.net',
    createdAt: '2008-06-01',
    password: '0561f0e68c602590e006a41b8a945d2f'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73d9'),
    id: 15,
    username: 'benjamin.doyle',
    email: 'ubruen@example.net',
    createdAt: '1986-11-26',
    password: 'cf0e43dedbf57f134467f989b64b2126'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73da'),
    id: 16,
    username: 'lchamplin',
    email: 'alexandrea00@example.net',
    createdAt: '1977-02-21',
    password: '9d2b39f53e4ef079c060fe87f8eefbbc'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73db'),
    id: 17,
    username: 'cruickshank.raheem',
    email: 'rice.tia@example.com',
    createdAt: '1979-11-09',
    password: 'e5d355b7dafcd1e85e0d020200e4ed5a'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73dc'),
    id: 18,
    username: 'qhomenick',
    email: 'wwisozk@example.org',
    createdAt: '1972-12-29',
    password: 'd62d83b7d1884a7ed45f585ddfa9cb03'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73dd'),
    id: 19,
    username: 'collins.minnie',
    email: 'edmond50@example.com',
    createdAt: '1981-03-04',
    password: '85a48b7fc09b174c51ae4c21f31f1817'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73de'),
    id: 20,
    username: 'qrowe',
    email: 'wiegand.elvis@example.net',
    createdAt: '2019-01-09',
    password: 'e7a85a658512704a83b72172e9928ad0'
  }
]
Type "it" for more
users> it
[
  {
    _id: ObjectId('630f4df1683a81f8b58a73df'),
    id: 21,
    username: 'heath71',
    email: 'beer.karl@example.com',
    createdAt: '1974-09-28',
    password: 'a9a7671d92596e9be92bd7f62dc5a55d'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73e0'),
    id: 22,
    username: 'epredovic',
    email: 'erunte@example.net',
    createdAt: '1999-11-08',
    password: '91b8fd1069cc926743431e40a16cb308'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73e1'),
    id: 23,
    username: 'magdalen19',
    email: 'mercedes.hessel@example.net',
    createdAt: '2011-06-12',
    password: 'a97b27935eae7467f599975ece4eb821'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73e2'),
    id: 24,
    username: 'madison.hermiston',
    email: 'grant.mariano@example.com',
    createdAt: '1995-12-25',
    password: 'b79417a62e0e2391483f869e33fbbcc8'
  },
  {
    _id: ObjectId('630f4df1683a81f8b58a73e3'),
    id: 25,
    username: 'clare08',
    email: 'fhickle@example.net',
    createdAt: '1971-02-20',
    password: '12d70565b1645ae77a607bacaf42bd03'
  }
]

```
# flag
```
users> show dbs
admin                  32.00 KiB
config                 96.00 KiB
local                  72.00 KiB
sensitive_information  32.00 KiB
users                  32.00 KiB
users> use sensitive_information
switched to db sensitive_information
sensitive_information> show collections
flag
sensitive_information> db.flag.find().pretty()
[
  {
    _id: ObjectId('630e3dbcb82540ebbd1748c5'),
    flag: '1b6e6fb359e7c40241b6d431427ba6ea'
  }
]

```