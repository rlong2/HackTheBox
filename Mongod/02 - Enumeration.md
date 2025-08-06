# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.61.167
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 06:13 MDT
Nmap scan report for 10.129.61.167
Host is up (0.055s latency).
Not shown: 65533 closed tcp ports (reset)
PORT      STATE SERVICE
22/tcp    open  ssh
27017/tcp open  mongod

Nmap done: 1 IP address (1 host up) scanned in 17.19 seconds              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 22,27017 10.129.61.167
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 06:17 MDT
Nmap scan report for 10.129.61.167
Host is up (0.051s latency).

PORT      STATE SERVICE VERSION
22/tcp    open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 48:ad:d5:b8:3a:9f:bc:be:f7:e8:20:1e:f6:bf:de:ae (RSA)
|   256 b7:89:6c:0b:20:ed:49:b2:c1:86:7c:29:92:74:1c:1f (ECDSA)
|_  256 18:cd:9d:08:a6:21:a8:b8:b6:f7:9f:8d:40:51:54:fb (ED25519)
27017/tcp open  mongodb MongoDB 3.6.8 3.6.8
| mongodb-databases: 
|   databases
|     1
|       sizeOnDisk = 73728.0
|       empty = false
|       name = config
|     0
|       sizeOnDisk = 32768.0
|       empty = false
|       name = admin
|     3
|       sizeOnDisk = 32768.0
|       empty = false
|       name = sensitive_information
|     2
|       sizeOnDisk = 73728.0
|       empty = false
|       name = local
|     4
|       sizeOnDisk = 32768.0
|       empty = false
|       name = users
|   totalSize = 245760.0
|_  ok = 1.0
| mongodb-info: 
|   MongoDB Build info
|     ok = 1.0
|     buildEnvironment
|       cxx = g++: g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
|       distmod = 
|       target_arch = x86_64
|       cc = cc: cc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
|       target_os = linux
|       linkflags = -Wl,-Bsymbolic-functions -Wl,-z,relro -pthread -Wl,-z,now -rdynamic -fstack-protector-strong -fuse-ld=gold -Wl,--build-id -Wl,--hash-style=gnu -Wl,-z,noexecstack -Wl,--warn-execstack -Wl,-z,relro
|       distarch = x86_64
|       ccflags = -fno-omit-frame-pointer -fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Wno-error=c++1z-compat -Wno-error=noexcept-type -Wno-error=format-truncation -Wno-error=int-in-bool-context -Winvalid-pch -O2 -Wno-unused-local-typedefs -Wno-unused-function -Wno-deprecated-declarations -Wno-unused-const-variable -Wno-unused-but-set-variable -Wno-missing-braces -Wno-format-truncation -fstack-protector-strong -fno-builtin-memcmp
|       cxxflags = -g -O2 -fdebug-prefix-map=/build/mongodb-FO9rLu/mongodb-3.6.9+really3.6.8+90~g8e540c0b6d=. -fstack-protector-strong -Wformat -Werror=format-security -Woverloaded-virtual -Wpessimizing-move -Wredundant-move -Wno-maybe-uninitialized -Wno-class-memaccess -std=c++14
|     modules
|     debug = false
|     maxBsonObjectSize = 16777216
|     storageEngines
|       1 = ephemeralForTest
|       0 = devnull
|       3 = wiredTiger
|       2 = mmapv1
|     javascriptEngine = mozjs
|     allocator = tcmalloc
|     bits = 64
|     gitVersion = 8e540c0b6db93ce994cc548f000900bdc740f80a
|     version = 3.6.8
|     sysInfo = deprecated
|     openssl
|       compiled = OpenSSL 1.1.1f  31 Mar 2020
|       running = OpenSSL 1.1.1f  31 Mar 2020
|     versionArray
|       1 = 6
|       0 = 3
|       3 = 0
|       2 = 8
|   Server status
|     mem
|       mappedWithJournal = 0
|       supported = true
|       mapped = 0
|       bits = 64
|       resident = 72
|       virtual = 956
|     opcounters
|       insert = 0
|       command = 4
|       query = 1
|       update = 0
|       getmore = 0
|       delete = 0
|     host = mongod
|     logicalSessionRecordCache
|       activeSessionsCount = 0
|       lastTransactionReaperJobDurationMillis = 0
|       lastSessionsCollectionJobDurationMillis = 0
|       lastTransactionReaperJobEntriesCleanedUp = 0
|       lastSessionsCollectionJobEntriesEnded = 0
|       lastSessionsCollectionJobCursorsClosed = 0
|       sessionsCollectionJobCount = 2
|       transactionReaperJobCount = 0
|       lastTransactionReaperJobTimestamp = 1754482330862
|       lastSessionsCollectionJobEntriesRefreshed = 0
|       lastSessionsCollectionJobTimestamp = 1754482630863
|     ok = 1.0
|     asserts
|       warning = 0
|       msg = 0
|       user = 0
|       rollovers = 0
|       regular = 0
|     connections
|       current = 2
|       available = 51198
|       totalCreated = 3
|     transportSecurity
|       1.0 = 0
|       1.1 = 0
|       1.2 = 0
|     transactions
|       transactionsCollectionWriteCount = 0
|       retriedCommandsCount = 0
|       retriedStatementsCount = 0
|     uptimeEstimate = 318
|     wiredTiger
|       session
|         table drop successful calls = 0
|         table compact successful calls = 0
|         table rebalance failed calls = 0
|         table rename successful calls = 0
|         open cursor count = 35
|         table alter failed calls = 0
|         table create failed calls = 0
|         table alter successful calls = 0
|         table alter unchanged and skipped = 0
|         table salvage failed calls = 0
|         table truncate failed calls = 0
|         table create successful calls = 1
|         table verify successful calls = 0
|         table compact failed calls = 0
|         table rename failed calls = 0
|         table truncate successful calls = 0
|         table salvage successful calls = 0
|         table verify failed calls = 0
|         table rebalance successful calls = 0
|         table drop failed calls = 0
|         open session count = 19
|       lock
|         dhandle lock application thread time waiting for the dhandle lock (usecs) = 0
|         commit timestamp queue write lock acquisitions = 0
|         schema lock application thread wait time (usecs) = 0
|         commit timestamp queue lock internal thread time waiting for the dhandle lock (usecs) = 0
|         read timestamp queue write lock acquisitions = 0
|         read timestamp queue lock application thread time waiting for the dhandle lock (usecs) = 0
|         read timestamp queue lock internal thread time waiting for the dhandle lock (usecs) = 0
|         dhandle read lock acquisitions = 1327
|         commit timestamp queue read lock acquisitions = 0
|         txn global read lock acquisitions = 21
|         schema lock acquisitions = 30
|         table lock application thread time waiting for the table lock (usecs) = 0
|         dhandle write lock acquisitions = 28
|         checkpoint lock internal thread wait time (usecs) = 0
|         txn global lock internal thread time waiting for the dhandle lock (usecs) = 0
|         checkpoint lock acquisitions = 6
|         read timestamp queue read lock acquisitions = 0
|         commit timestamp queue lock application thread time waiting for the dhandle lock (usecs) = 0
|         metadata lock acquisitions = 6
|         table write lock acquisitions = 12
|         table read lock acquisitions = 0
|         table lock internal thread time waiting for the table lock (usecs) = 0
|         metadata lock application thread wait time (usecs) = 0
|         schema lock internal thread wait time (usecs) = 0
|         metadata lock internal thread wait time (usecs) = 0
|         txn global write lock acquisitions = 17
|         dhandle lock internal thread time waiting for the dhandle lock (usecs) = 0
|         checkpoint lock application thread wait time (usecs) = 0
|         txn global lock application thread time waiting for the dhandle lock (usecs) = 0
|       perf
|         file system write latency histogram (bucket 3) - 100-249ms = 0
|         file system write latency histogram (bucket 2) - 50-99ms = 0
|         file system write latency histogram (bucket 1) - 10-49ms = 0
|         file system read latency histogram (bucket 3) - 100-249ms = 1
|         file system write latency histogram (bucket 6) - 1000ms+ = 0
|         operation read latency histogram (bucket 3) - 500-999us = 0
|         file system read latency histogram (bucket 2) - 50-99ms = 0
|         operation write latency histogram (bucket 1) - 100-249us = 0
|         operation write latency histogram (bucket 5) - 10000us+ = 0
|         operation read latency histogram (bucket 1) - 100-249us = 0
|         operation write latency histogram (bucket 3) - 500-999us = 1
|         operation write latency histogram (bucket 2) - 250-499us = 0
|         operation read latency histogram (bucket 2) - 250-499us = 0
|         operation write latency histogram (bucket 4) - 1000-9999us = 0
|         file system read latency histogram (bucket 1) - 10-49ms = 2
|         file system read latency histogram (bucket 4) - 250-499ms = 0
|         file system write latency histogram (bucket 5) - 500-999ms = 0
|         file system read latency histogram (bucket 6) - 1000ms+ = 0
|         operation read latency histogram (bucket 5) - 10000us+ = 0
|         operation read latency histogram (bucket 4) - 1000-9999us = 0
|         file system read latency histogram (bucket 5) - 500-999ms = 0
|         file system write latency histogram (bucket 4) - 250-499ms = 0
|       thread-yield
|         application thread time evicting (usecs) = 0
|         page reconciliation yielded due to child modification = 0
|         data handle lock yielded = 0
|         page delete rollback time sleeping for state change (usecs) = 0
|         connection close blocked waiting for transaction state stabilization = 0
|         application thread time waiting for cache (usecs) = 0
|         connection close yielded for lsm manager shutdown = 0
|         page acquire locked blocked = 0
|         page acquire read blocked = 0
|         page acquire time sleeping (usecs) = 0
|         page access yielded due to prepare state change = 0
|         page acquire eviction blocked = 0
|         page acquire busy blocked = 0
|         get reference for page index and slot time sleeping (usecs) = 0
|         log server sync yielded for log write = 0
|       data-handle
|         connection data handles currently active = 22
|         session sweep attempts = 19
|         connection sweep time-of-death sets = 13
|         session dhandles swept = 0
|         connection sweep dhandles removed from hash list = 3
|         connection sweep candidate became referenced = 0
|         connection sweeps = 153
|         connection sweep dhandles closed = 0
|       log
|         slot join atomic update races = 0
|         log scan operations = 6
|         log scan records requiring two reads = 0
|         log force write operations skipped = 3473
|         records processed by log scan = 13
|         log bytes written = 6656
|         total in-memory size of compressed records = 6456
|         log bytes of payload data = 4529
|         log sync_dir operations = 1
|         log files manually zero-filled = 0
|         log sync time duration (usecs) = 16493
|         log release advances write LSN = 5
|         log write operations = 17
|         log sync operations = 11
|         maximum log file size = 104857600
|         busy returns attempting to switch slots = 0
|         slot join calls atomic updates raced = 0
|         log records too small to compress = 12
|         slot join found active slot closed = 0
|         log records not compressed = 0
|         slot join calls did not yield = 17
|         number of pre-allocated log files to create = 2
|         slot joins yield time (usecs) = 0
|         written slots coalesced = 0
|         slot join calls found active slot closed = 0
|         log server thread advances write LSN = 6
|         total log buffer size = 33554432
|         slot unbuffered writes = 0
|         slot transitions unable to find free slot = 0
|         yields waiting for previous log file close = 0
|         slot closures = 11
|         slot close unbuffered waits = 0
|         slot join calls slept = 0
|         slot join calls yielded = 0
|         total size of compressed records = 4271
|         pre-allocated log files prepared = 2
|         log flush operations = 3148
|         log server thread write LSN walk skipped = 1313
|         log records compressed = 5
|         logging bytes consolidated = 6144
|         force archive time sleeping (usecs) = 0
|         log sync_dir time duration (usecs) = 1260
|         pre-allocated log files not ready and missed = 1
|         slot close lost race = 0
|         log force write operations = 3479
|         pre-allocated log files used = 0
|       thread-state
|         active filesystem write calls = 0
|         active filesystem fsync calls = 0
|         active filesystem read calls = 0
|       transaction
|         prepared transactions rolled back = 0
|         rollback to stable updates aborted = 0
|         transaction checkpoint most recent time (msecs) = 0
|         read timestamp queue insert to empty = 0
|         query timestamp calls = 1333
|         transaction failures due to cache overflow = 0
|         number of named snapshots created = 0
|         set timestamp oldest updates = 0
|         transactions committed = 2
|         transaction range of IDs currently pinned by named snapshots = 0
|         transaction begins = 16
|         number of named snapshots dropped = 0
|         transaction checkpoint min time (msecs) = 0
|         prepared transactions currently active = 0
|         set timestamp stable calls = 0
|         read timestamp queue inserts total = 0
|         prepared transactions = 0
|         commit timestamp queue inserts total = 0
|         commit timestamp queue inserts to tail = 0
|         set timestamp oldest calls = 0
|         transaction range of timestamps pinned by the oldest timestamp = 0
|         transaction checkpoint scrub time (msecs) = 0
|         prepared transactions committed = 0
|         transaction fsync duration for checkpoint after allocating the transaction ID (usecs) = 0
|         update conflicts = 0
|         transactions rolled back = 14
|         transaction range of IDs currently pinned = 0
|         transaction checkpoints skipped because database was clean = 0
|         read timestamp queue inserts to head = 0
|         transaction sync calls = 0
|         rollback to stable updates removed from lookaside = 0
|         transaction range of IDs currently pinned by a checkpoint = 0
|         transaction fsync calls for checkpoint after allocating the transaction ID = 6
|         read timestamp queue length = 0
|         transaction range of timestamps currently pinned = 0
|         set timestamp commit updates = 0
|         commit timestamp queue length = 0
|         transaction checkpoint currently running = 0
|         commit timestamp queue insert to empty = 0
|         set timestamp calls = 0
|         transaction checkpoints = 6
|         set timestamp commit calls = 0
|         transaction checkpoint total time (msecs) = 49
|         set timestamp stable updates = 0
|         rollback to stable calls = 0
|         transaction checkpoint generation = 7
|         transaction checkpoint scrub dirty target = 0
|         transaction checkpoint max time (msecs) = 21
|       LSM
|         tree maintenance operations executed = 0
|         tree maintenance operations scheduled = 0
|         rows merged in an LSM tree = 0
|         merge work units currently queued = 0
|         tree queue hit maximum = 0
|         switch work units currently queued = 0
|         sleep for LSM checkpoint throttle = 0
|         sleep for LSM merge throttle = 0
|         application work units currently queued = 0
|         tree maintenance operations discarded = 0
|       reconciliation
|         split bytes currently awaiting free = 0
|         fast-path pages deleted = 0
|         pages deleted = 0
|         page reconciliation calls = 11
|         split objects currently awaiting free = 0
|         page reconciliation calls for eviction = 0
|       connection
|         pthread mutex shared lock write-lock calls = 422
|         files currently open = 15
|         total read I/Os = 1284
|         total fsync I/Os = 36
|         pthread mutex shared lock read-lock calls = 2359
|         total write I/Os = 42
|         pthread mutex condition wait calls = 5286
|         detected system time went backwards = 0
|         auto adjusting condition resets = 34
|         memory re-allocations = 1075
|         auto adjusting condition wait calls = 1978
|         memory frees = 7972
|         memory allocations = 8932
|       cache
|         maximum page size at eviction = 0
|         eviction worker thread removed = 0
|         bytes belonging to page images in the cache = 57991
|         application threads page read from disk to cache count = 8
|         modified pages evicted by application threads = 0
|         eviction server slept, because we did not make progress with eviction = 0
|         application threads page write from cache to disk count = 10
|         eviction walks gave up because they restarted their walk twice = 0
|         eviction walk target pages histogram - 128 and higher = 0
|         tracked dirty pages in the cache = 0
|         checkpoint blocked page eviction = 0
|         eviction walks abandoned = 0
|         pages evicted because they had chains of deleted items time (usecs) = 0
|         lookaside table remove calls = 0
|         bytes written from cache = 67128
|         lookaside table insert calls = 0
|         tracked dirty bytes in the cache = 0
|         failed eviction of pages that exceeded the in-memory maximum count = 0
|         eviction walks gave up because they saw too many pages and found too few candidates = 0
|         eviction walk target pages histogram - 10-31 = 0
|         modified pages evicted = 0
|         eviction passes of a file = 0
|         page written requiring lookaside records = 0
|         failed eviction of pages that exceeded the in-memory maximum time (usecs) = 0
|         pages evicted because they exceeded the in-memory maximum time (usecs) = 0
|         overflow pages read into cache = 0
|         files with active eviction walks = 0
|         page split during eviction deepened the tree = 0
|         application threads page read from disk to cache time (usecs) = 4402
|         eviction empty score = 0
|         internal pages evicted = 0
|         pages read into cache requiring lookaside for checkpoint = 0
|         maximum bytes configured = 502267904
|         eviction walk target pages histogram - 0-9 = 0
|         pages read into cache after truncate = 1
|         hazard pointer check entries walked = 0
|         pages queued for urgent eviction during walk = 0
|         pages read into cache with skipped lookaside entries needed later by checkpoint = 0
|         eviction server candidate queue empty when topping up = 0
|         force re-tuning of eviction workers once in a while = 0
|         unmodified pages evicted = 0
|         leaf pages split during eviction = 0
|         eviction currently operating in aggressive mode = 0
|         eviction worker thread evicting pages = 0
|         bytes read into cache = 53696
|         pages written requiring in-memory restoration = 0
|         pages read into cache = 18
|         tracked bytes belonging to internal pages in the cache = 3398
|         pages evicted by application threads = 0
|         in-memory page passed criteria to be split = 0
|         eviction walks started from root of tree = 0
|         eviction calls to get a page = 0
|         pages read into cache after truncate in prepare state = 0
|         pages seen by eviction walk = 0
|         eviction walk target pages histogram - 64-128 = 0
|         eviction worker thread stable number = 0
|         pages read into cache with skipped lookaside entries needed later = 0
|         pages read into cache skipping older lookaside entries = 0
|         pages read into cache requiring lookaside entries = 0
|         pages selected for eviction unable to be evicted = 0
|         tracked bytes belonging to leaf pages in the cache = 69152
|         pages queued for urgent eviction = 0
|         bytes not belonging to page images in the cache = 14558
|         hazard pointer blocked page eviction = 0
|         percentage overhead = 8
|         pages evicted because they had chains of deleted items count = 0
|         lookaside score = 0
|         in-memory page splits = 0
|         pages evicted because they exceeded the in-memory maximum count = 0
|         lookaside table entries = 0
|         eviction server unable to reach eviction goal = 0
|         bytes currently in the cache = 72550
|         hazard pointer maximum array length = 0
|         eviction calls to get a page found queue empty = 0
|         eviction worker thread created = 0
|         eviction walk target pages histogram - 32-63 = 0
|         eviction server candidate queue not empty when topping up = 0
|         pages queued for eviction = 0
|         hazard pointer check calls = 0
|         eviction calls to get a page found queue empty after locking = 0
|         pages walked for eviction = 0
|         application threads page write from cache to disk time (usecs) = 585
|         eviction walks reached end of tree = 0
|         eviction server evicting pages = 0
|         files with new eviction walks started = 0
|         eviction walks gave up because they saw too many pages and found no candidates = 0
|         bytes belonging to the lookaside table in the cache = 182
|         pages requested from the cache = 382
|         pages written from cache = 11
|         eviction walks started from saved location in tree = 0
|         pages currently held in the cache = 22
|         eviction state = 32
|         internal pages split during eviction = 0
|         eviction worker thread active = 4
|       concurrentTransactions
|         write
|           totalTickets = 128
|           available = 128
|           out = 0
|         read
|           totalTickets = 128
|           available = 127
|           out = 1
|       block-manager
|         mapped bytes read = 0
|         bytes written for checkpoint = 126976
|         bytes written = 126976
|         bytes read = 143360
|         blocks pre-loaded = 9
|         mapped blocks read = 0
|         blocks read = 31
|         blocks written = 23
|       async
|         total update calls = 0
|         number of times operation allocation failed = 0
|         total insert calls = 0
|         total allocations = 0
|         current work queue length = 0
|         number of flush calls = 0
|         number of allocation state races = 0
|         total search calls = 0
|         maximum work queue length = 0
|         total compact calls = 0
|         number of operation slots viewed for allocation = 0
|         total remove calls = 0
|         number of times worker found no work = 0
|       uri = statistics:
|       cursor
|         cursor search calls = 302
|         cursor create calls = 38
|         cursor remove calls = 1
|         cursor reserve calls = 0
|         cursor search near calls = 6
|         cursor modify calls = 0
|         cursor reset calls = 351
|         cursor update calls = 0
|         truncate calls = 0
|         cursors reused from cache = 0
|         cursors cached on close = 0
|         cursor next calls = 77
|         cursor sweep cursors examined = 0
|         cursor restarted searches = 0
|         cursor sweep buckets = 0
|         cursor prev calls = 11
|         cursor sweep cursors closed = 0
|         cursor sweeps = 0
|         cursor insert calls = 12
|     metrics
|       ttl
|         passes = 5
|         deletedDocuments = 0
|       record
|         moves = 0
|       repl
|         network
|           getmores
|             totalMillis = 0
|             num = 0
|           bytes = 0
|           ops = 0
|           readersCreated = 0
|         executor
|           queues
|             sleepers = 0
|             networkInProgress = 0
|           shuttingDown = false
|           unsignaledEvents = 0
|           pool
|             inProgressCount = 0
|           networkInterface = 
|           NetworkInterfaceASIO Operations' Diagnostic:
|           Operation:    Count:   
|           Connecting    0        
|           In Progress   0        
|           Succeeded     0        
|           Canceled      0        
|           Failed        0        
|           Timed Out     0        
|           
|         preload
|           indexes
|             totalMillis = 0
|             num = 0
|           docs
|             totalMillis = 0
|             num = 0
|         buffer
|           count = 0
|           maxSizeBytes = 0
|           sizeBytes = 0
|         apply
|           batches
|             totalMillis = 0
|             num = 0
|           attemptsToBecomeSecondary = 0
|           ops = 0
|         initialSync
|           failures = 0
|           failedAttempts = 0
|           completed = 0
|       operation
|         writeConflicts = 0
|         scanAndOrder = 0
|       commands
|         _migrateClone
|           failed = 0
|           total = 0
|         group
|           failed = 0
|           total = 0
|         _getNextSessionMods
|           failed = 0
|           total = 0
|         setFeatureCompatibilityVersion
|           failed = 0
|           total = 0
|         startSession
|           failed = 0
|           total = 0
|         splitVector
|           failed = 0
|           total = 0
|         lockInfo
|           failed = 0
|           total = 0
|         getPrevError
|           failed = 0
|           total = 0
|         revokeRolesFromUser
|           failed = 0
|           total = 0
|         _configsvrCommitChunkMerge
|           failed = 0
|           total = 0
|         updateUser
|           failed = 0
|           total = 0
|         _recvChunkStart
|           failed = 0
|           total = 0
|         connPoolStats
|           failed = 0
|           total = 0
|         cloneCollectionAsCapped
|           failed = 0
|           total = 0
|         delete
|           failed = 0
|           total = 0
|         killSessions
|           failed = 0
|           total = 0
|         hostInfo
|           failed = 0
|           total = 0
|         dataSize
|           failed = 0
|           total = 0
|         saslContinue
|           failed = 0
|           total = 0
|         killAllSessions
|           failed = 0
|           total = 0
|         authSchemaUpgrade
|           failed = 0
|           total = 0
|         find
|           failed = 0
|           total = 1
|         revokeRolesFromRole
|           failed = 0
|           total = 0
|         driverOIDTest
|           failed = 0
|           total = 0
|         invalidateUserCache
|           failed = 0
|           total = 0
|         connectionStatus
|           failed = 0
|           total = 0
|         reIndex
|           failed = 0
|           total = 0
|         drop
|           failed = 0
|           total = 0
|         logRotate
|           failed = 0
|           total = 0
|         dbStats
|           failed = 0
|           total = 0
|         <UNKNOWN> = 0
|         collMod
|           failed = 0
|           total = 0
|         refreshSessions
|           failed = 0
|           total = 0
|         getDiagnosticData
|           failed = 0
|           total = 0
|         features
|           failed = 0
|           total = 0
|         ping
|           failed = 0
|           total = 0
|         shardConnPoolStats
|           failed = 0
|           total = 0
|         unsetSharding
|           failed = 0
|           total = 0
|         killOp
|           failed = 0
|           total = 0
|         copydbsaslstart
|           failed = 0
|           total = 0
|         filemd5
|           failed = 0
|           total = 0
|         _transferMods
|           failed = 0
|           total = 0
|         replSetReconfig
|           failed = 0
|           total = 0
|         usersInfo
|           failed = 0
|           total = 0
|         refreshSessionsInternal
|           failed = 0
|           total = 0
|         _recvChunkStatus
|           failed = 0
|           total = 0
|         createIndexes
|           failed = 0
|           total = 2
|         _isSelf
|           failed = 0
|           total = 0
|         dropAllRolesFromDatabase
|           failed = 0
|           total = 0
|         _configsvrEnableSharding
|           failed = 0
|           total = 0
|         appendOplogNote
|           failed = 0
|           total = 0
|         grantRolesToRole
|           failed = 0
|           total = 0
|         _recvChunkAbort
|           failed = 0
|           total = 0
|         convertToCapped
|           failed = 0
|           total = 0
|         parallelCollectionScan
|           failed = 0
|           total = 0
|         dropRole
|           failed = 0
|           total = 0
|         dbHash
|           failed = 0
|           total = 0
|         _configsvrBalancerStart
|           failed = 0
|           total = 0
|         _recvChunkCommit
|           failed = 0
|           total = 0
|         _configsvrCommitChunkSplit
|           failed = 0
|           total = 0
|         replSetMaintenance
|           failed = 0
|           total = 0
|         logout
|           failed = 0
|           total = 0
|         dropAllUsersFromDatabase
|           failed = 0
|           total = 0
|         getShardMap
|           failed = 0
|           total = 0
|         _configsvrRemoveShard
|           failed = 0
|           total = 0
|         insert
|           failed = 0
|           total = 0
|         _configsvrCreateDatabase
|           failed = 0
|           total = 0
|         planCacheListPlans
|           failed = 0
|           total = 0
|         dropUser
|           failed = 0
|           total = 0
|         _configsvrUpdateZoneKeyRange
|           failed = 0
|           total = 0
|         buildInfo
|           failed = 0
|           total = 0
|         mapreduce
|           shardedfinish
|             failed = 0
|             total = 0
|         replSetSyncFrom
|           failed = 0
|           total = 0
|         getCmdLineOpts
|           failed = 0
|           total = 0
|         profile
|           failed = 0
|           total = 0
|         mergeChunks
|           failed = 0
|           total = 0
|         whatsmyuri
|           failed = 0
|           total = 0
|         cloneCollection
|           failed = 0
|           total = 0
|         validate
|           failed = 0
|           total = 0
|         replSetStepDown
|           failed = 0
|           total = 0
|         updateRole
|           failed = 0
|           total = 0
|         renameCollection
|           failed = 0
|           total = 0
|         _configsvrAddShardToZone
|           failed = 0
|           total = 0
|         replSetGetRBID
|           failed = 0
|           total = 0
|         _configsvrCommitChunkMigration
|           failed = 0
|           total = 0
|         update
|           failed = 0
|           total = 0
|         touch
|           failed = 0
|           total = 0
|         repairCursor
|           failed = 0
|           total = 0
|         listIndexes
|           failed = 0
|           total = 0
|         getParameter
|           failed = 0
|           total = 0
|         _mergeAuthzCollections
|           failed = 0
|           total = 0
|         planCacheListFilters
|           failed = 0
|           total = 0
|         moveChunk
|           failed = 0
|           total = 0
|         replSetElect
|           failed = 0
|           total = 0
|         planCacheClearFilters
|           failed = 0
|           total = 0
|         splitChunk
|           failed = 0
|           total = 0
|         shutdown
|           failed = 0
|           total = 0
|         explain
|           failed = 0
|           total = 0
|         shardingState
|           failed = 0
|           total = 0
|         getShardVersion
|           failed = 0
|           total = 0
|         copydb
|           failed = 0
|           total = 0
|         setShardVersion
|           failed = 0
|           total = 0
|         setParameter
|           failed = 0
|           total = 0
|         serverStatus
|           failed = 0
|           total = 2
|         geoSearch
|           failed = 0
|           total = 0
|         saslStart
|           failed = 0
|           total = 0
|         fsyncUnlock
|           failed = 0
|           total = 0
|         rolesInfo
|           failed = 0
|           total = 0
|         forceerror
|           failed = 0
|           total = 0
|         revokePrivilegesFromRole
|           failed = 0
|           total = 0
|         dropDatabase
|           failed = 0
|           total = 0
|         grantPrivilegesToRole
|           failed = 0
|           total = 0
|         resetError
|           failed = 0
|           total = 0
|         geoNear
|           failed = 0
|           total = 0
|         replSetStepUp
|           failed = 0
|           total = 0
|         _configsvrShardCollection
|           failed = 0
|           total = 0
|         replSetResizeOplog
|           failed = 0
|           total = 0
|         replSetRequestVotes
|           failed = 0
|           total = 0
|         replSetInitiate
|           failed = 0
|           total = 0
|         planCacheClear
|           failed = 0
|           total = 0
|         _configsvrBalancerStop
|           failed = 0
|           total = 0
|         authenticate
|           failed = 0
|           total = 0
|         replSetHeartbeat
|           failed = 0
|           total = 0
|         createRole
|           failed = 0
|           total = 0
|         replSetGetStatus
|           failed = 0
|           total = 0
|         replSetGetConfig
|           failed = 0
|           total = 0
|         replSetFresh
|           failed = 0
|           total = 0
|         replSetFreeze
|           failed = 0
|           total = 0
|         compact
|           failed = 0
|           total = 0
|         replSetAbortPrimaryCatchUp
|           failed = 0
|           total = 0
|         repairDatabase
|           failed = 0
|           total = 0
|         top
|           failed = 0
|           total = 0
|         collStats
|           failed = 0
|           total = 0
|         applyOps
|           failed = 0
|           total = 0
|         _configsvrMovePrimary
|           failed = 0
|           total = 0
|         copydbgetnonce
|           failed = 0
|           total = 0
|         _flushRoutingTableCacheUpdates
|           failed = 0
|           total = 0
|         findAndModify
|           failed = 0
|           total = 0
|         killAllSessionsByPattern
|           failed = 0
|           total = 0
|         handshake
|           failed = 0
|           total = 0
|         availableQueryOptions
|           failed = 0
|           total = 0
|         create
|           failed = 0
|           total = 0
|         mapReduce
|           failed = 0
|           total = 0
|         cleanupOrphaned
|           failed = 0
|           total = 0
|         getLog
|           failed = 0
|           total = 0
|         getnonce
|           failed = 0
|           total = 0
|         connPoolSync
|           failed = 0
|           total = 0
|         checkShardingIndex
|           failed = 0
|           total = 0
|         _configsvrAddShard
|           failed = 0
|           total = 0
|         createUser
|           failed = 0
|           total = 0
|         grantRolesToUser
|           failed = 0
|           total = 0
|         _configsvrMoveChunk
|           failed = 0
|           total = 0
|         _configsvrBalancerStatus
|           failed = 0
|           total = 0
|         dropIndexes
|           failed = 0
|           total = 0
|         getMore
|           failed = 0
|           total = 0
|         planCacheListQueryShapes
|           failed = 0
|           total = 0
|         clone
|           failed = 0
|           total = 0
|         fsync
|           failed = 0
|           total = 0
|         replSetUpdatePosition
|           failed = 0
|           total = 0
|         getLastError
|           failed = 0
|           total = 0
|         count
|           failed = 0
|           total = 0
|         _configsvrRemoveShardFromZone
|           failed = 0
|           total = 0
|         isMaster
|           failed = 0
|           total = 0
|         aggregate
|           failed = 0
|           total = 0
|         currentOp
|           failed = 0
|           total = 0
|         planCacheSetFilter
|           failed = 0
|           total = 0
|         distinct
|           failed = 0
|           total = 0
|         listCommands
|           failed = 0
|           total = 0
|         listDatabases
|           failed = 0
|           total = 0
|         _getUserCacheGeneration
|           failed = 0
|           total = 0
|         killCursors
|           failed = 0
|           total = 0
|         eval
|           failed = 0
|           total = 0
|         resync
|           failed = 0
|           total = 0
|         endSessions
|           failed = 0
|           total = 0
|         listCollections
|           failed = 0
|           total = 0
|       storage
|         freelist
|           search
|             bucketExhausted = 0
|             scanned = 0
|             requests = 0
|       getLastError
|         wtimeouts = 0
|         wtime
|           totalMillis = 0
|           num = 0
|       queryExecutor
|         scannedObjects = 0
|         scanned = 0
|       document
|         updated = 0
|         inserted = 0
|         deleted = 0
|         returned = 0
|       cursor
|         timedOut = 0
|         open
|           pinned = 0
|           total = 0
|           noTimeout = 0
|     opLatencies
|       reads
|         ops = 0
|         latency = 0
|       writes
|         ops = 0
|         latency = 0
|       commands
|         ops = 1
|         latency = 599
|     storageEngine
|       persistent = true
|       name = wiredTiger
|       readOnly = false
|       supportsCommittedReads = true
|     uptimeMillis = 318471
|     opcountersRepl
|       insert = 0
|       command = 0
|       query = 0
|       update = 0
|       getmore = 0
|       delete = 0
|     version = 3.6.8
|     network
|       physicalBytesOut = 29858
|       bytesOut = 29858
|       physicalBytesIn = 126
|       compression
|         snappy
|           decompressor
|             bytesIn = 0
|             bytesOut = 0
|           compressor
|             bytesIn = 0
|             bytesOut = 0
|       serviceExecutorTaskStats
|         threadsRunning = 1
|         executor = passthrough
|       bytesIn = 126
|       numRequests = 2
|     localTime = 1754482646164
|     extra_info
|       note = fields vary by platform
|       page_faults = 268
|     uptime = 318.0
|     process = mongod
|     tcmalloc
|       generic
|         current_allocated_bytes = 67894456
|         heap_size = 71802880
|       tcmalloc
|         total_free_bytes = 2073416
|         pageheap_commit_count = 47
|         pageheap_total_commit_bytes = 71802880
|         pageheap_scavenge_count = 0
|         pageheap_total_decommit_bytes = 0
|         pageheap_free_bytes = 1835008
|         pageheap_committed_bytes = 71802880
|         pageheap_reserve_count = 47
|         aggressive_memory_decommit = 0
|         formattedString = ------------------------------------------------
|         MALLOC:       67895032 (   64.7 MiB) Bytes in use by application
|         MALLOC: +      1835008 (    1.8 MiB) Bytes in page heap freelist
|         MALLOC: +       600808 (    0.6 MiB) Bytes in central cache freelist
|         MALLOC: +       154624 (    0.1 MiB) Bytes in transfer cache freelist
|         MALLOC: +      1317408 (    1.3 MiB) Bytes in thread cache freelists
|         MALLOC: +      2752512 (    2.6 MiB) Bytes in malloc metadata
|         MALLOC:   ------------
|         MALLOC: =     74555392 (   71.1 MiB) Actual memory used (physical + swap)
|         MALLOC: +            0 (    0.0 MiB) Bytes released to OS (aka unmapped)
|         MALLOC:   ------------
|         MALLOC: =     74555392 (   71.1 MiB) Virtual address space used
|         MALLOC:
|         MALLOC:            503              Spans in use
|         MALLOC:             17              Thread heaps in use
|         MALLOC:           8192              Tcmalloc page size
|         ------------------------------------------------
|         Call ReleaseFreeMemory() to release freelist memory to the OS (via madvise()).
|         Bytes released to the OS take up virtual address space but no physical memory.
|         pageheap_unmapped_bytes = 0
|         pageheap_total_reserve_bytes = 71802880
|         max_total_thread_cache_bytes = 258998272
|         current_total_thread_cache_bytes = 1317984
|         thread_cache_free_bytes = 1317984
|         central_cache_free_bytes = 600808
|         pageheap_decommit_count = 0
|         transfer_cache_free_bytes = 154624
|     locks
|       Database
|         acquireCount
|           W = 8
|           R = 5
|           w = 9
|           r = 425
|       Global
|         acquireCount
|           W = 5
|           w = 17
|           r = 1200
|       Collection
|         acquireCount
|           w = 7
|           r = 425
|     pid = 839
|     globalLock
|       activeClients
|         writers = 0
|         total = 11
|         readers = 0
|       totalTime = 318433000
|       currentQueue
|         writers = 0
|         total = 0
|_        readers = 0
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 11.42 seconds

```