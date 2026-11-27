Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763768;
	b=X9WGjEsK1fFuKIuqAGwwrPuJhiYEE5iOFmLUAopPBYdYdwkvxuy4QltUzmtLB7WtwfoY
	 yagqmIkam8vLOVzEcMHSkny7Rp/Zqg4tQjzwtonQK1Nr+3tWs8G/6mUb9HNNlNF8yuQ1H
	 XwAtLxqyBLMQ+AiJEsOn1e2qMPhfS6aZWgevXFHE3b0KmT7KJCuqfkQjwB+IfJFVWbOqt
	 nyX1spI3mBuvPOPlpCQH1OLYzjdUOhd6CZAVVHfrXShgK+RJ8AiO0/oK0arvtxUwm+Zbg
	 RGjKjJKglV6AiDvF+3th7Uc/p8/+nSgKIo67vqv7P2HcHmu0oyu9+CNyIotIIQPFdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763768;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WlyVMIf+w2EK4kCSEt6kaV0RPIZEQmXW1mV3dcuujUQ=;
	b=bQ+gkDdF5sqIRXkCwr7n+Nst4+aiU2X4glz2GtTUrWpyx1Yzg17Y42D8y4vaZutqfeNT
	 YBC4epFtu7uap9tWpfMGYJTmUSe6kgwGbIVFVQJ2OnQvo86uqLTplaJAMi9o1CE4Y0ykO
	 pRDSj7WoJHryGsa9b2RgJbl8lBdC5dKYiwZEg/DpgpBgyW+h62VIC4mYVFnMlIGhwXA9+
	 +duuQjDofKpf4xHW79RLgRnEyifzAmRPe3U37788TfoSIB9+1hkdu6W1bvLad6ZBNxmza
	 nNvjiZttCFSKS6YgrJtc88Tz9LzUVSwpET20lFP3hsTsl1DIPhI4+Qc1gVGEklkXSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BAmhBnEC;
	arc=none smtp.remote-ip=95.215.58.189
Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73003606A31C
	for <printk@lists.linux.dev>; Fri, 27 Nov 2026 07:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73003606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BAmhBnEC
X-Envelope-To: printk@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=UZ9O/NjNPc2csaBXueC5lS/m897rTjKX3GK+oQ+Naos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795763764; v=1; x=1796368564;
 b=BAmhBnECdHQLGTcuEm4vGzReBW93g4dgWBXd7QcUMyF0AFNUozbGBfV9qHhBcfA87gNHDZOc
 PU1XVxeU1FbAwofaKCY/EpLz2qekhQbM64e0pDDnh1qPVJo4j1Pk0/++IBl8ZMYAbgns2S5coj4
 MSUf5vvUqqxDNcnOo4PBZKyM=
X-Envelope-To: printk@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 094f7b84a20c887f;
	Fri, 27 Nov 2026 07:16:04 +0000
X-Mizu-Trace-ID: 094f7b84a20c887f
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: printk@lists.linux.dev
Cc: Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v1] printk: clear saved_console_loglevel on /proc/sys/kernel/printk writes
Date: Fri, 27 Nov 2026 16:15:48 +0900
Message-ID: <20261127071548.333115-1-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

When console logging is temporarily disabled via syslog(2)
SYSLOG_ACTION_CONSOLE_OFF (e.g., "dmesg -D" or Plymouth during boot),
do_syslog() stores console_loglevel in saved_console_loglevel and later
restores it on SYSLOG_ACTION_CONSOLE_ON (e.g., "dmesg -E" or
plymouth-quit).

Commit 1aaad49e856c ("printk: Restore previous console_loglevel when
re-enabling logging") clears saved_console_loglevel on
SYSLOG_ACTION_CONSOLE_LEVEL ("dmesg -n") so an explicit loglevel update
implicitly re-enables console logging. However, /proc/sys/kernel/printk
uses proc_dointvec() directly and leaves saved_console_loglevel stale.
If systemd-sysctl sets kernel.printk (e.g., "4 4 1 7") while console
logging is disabled during boot, a later SYSLOG_ACTION_CONSOLE_ON
silently overwrites console_loglevel back to the old saved value (e.g.,
7), flooding slow serial consoles with notice/info messages.

Move saved_console_loglevel to file scope and wrap proc_dointvec() in
printk_sysctl_set_loglvl() to reset saved_console_loglevel to
LOGLEVEL_DEFAULT on successful writes, while leaving it intact on reads,
empty/invalid writes, and non-zero-offset writes ignored under
SYSCTL_WRITES_STRICT. Because /proc/sys/kernel/printk always writes
starting at console_loglevel, valid offset-0 writes clear
saved_console_loglevel even when re-writing the current loglevel (e.g.,
kernel.printk = "1 4 1 7"), matching SYSLOG_ACTION_CONSOLE_LEVEL
semantics (at the cost of also clearing it if a caller rewrites
console_loglevel solely to adjust later fields).

Serialize saved_console_loglevel and console_printk[] updates across
do_syslog() and /proc/sys/kernel/printk with a dedicated
console_loglevel_lock mutex (using READ_ONCE/WRITE_ONCE for
console_loglevel to match proc_dointvec()), keeping syslog_lock scoped
to ringbuffer reader state and avoiding contention or lock-ordering
dependencies with syslog readers and console registration.

Fixes: 1aaad49e856c ("printk: Restore previous console_loglevel when re-enabling logging")
Cc: stable@vger.kernel.org
Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
 kernel/printk/internal.h |  2 ++
 kernel/printk/printk.c   | 50 ++++++++++++++++++++++++++++++++++++----
 kernel/printk/sysctl.c   |  2 +-
 3 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe..8bae853c64b7 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -10,6 +10,8 @@
 void __init printk_sysctl_init(void);
 int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
 			      void *buffer, size_t *lenp, loff_t *ppos);
+int printk_sysctl_set_loglvl(const struct ctl_table *table, int write,
+			     void *buffer, size_t *lenp, loff_t *ppos);
 #else
 #define printk_sysctl_init() do { } while (0)
 #endif
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5dbcf8a9909b..c6d2bec573b6 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1737,11 +1737,17 @@ static void syslog_clear(void)
 	mutex_unlock(&syslog_lock);
 }
 
+/*
+ * Protects @saved_console_loglevel and serializes syslog(2) and
+ * /proc/sys/kernel/printk updates to console_printk[].
+ */
+static DEFINE_MUTEX(console_loglevel_lock);
+static int saved_console_loglevel = LOGLEVEL_DEFAULT;
+
 int do_syslog(int type, char __user *buf, int len, int source)
 {
 	struct printk_info info;
 	bool clear = false;
-	static int saved_console_loglevel = LOGLEVEL_DEFAULT;
 	int error;
 
 	error = check_syslog_permissions(type, source);
@@ -1782,26 +1788,32 @@ int do_syslog(int type, char __user *buf, int len, int source)
 		break;
 	/* Disable logging to console */
 	case SYSLOG_ACTION_CONSOLE_OFF:
+		mutex_lock(&console_loglevel_lock);
 		if (saved_console_loglevel == LOGLEVEL_DEFAULT)
-			saved_console_loglevel = console_loglevel;
-		console_loglevel = minimum_console_loglevel;
+			saved_console_loglevel = READ_ONCE(console_loglevel);
+		WRITE_ONCE(console_loglevel, minimum_console_loglevel);
+		mutex_unlock(&console_loglevel_lock);
 		break;
 	/* Enable logging to console */
 	case SYSLOG_ACTION_CONSOLE_ON:
+		mutex_lock(&console_loglevel_lock);
 		if (saved_console_loglevel != LOGLEVEL_DEFAULT) {
-			console_loglevel = saved_console_loglevel;
+			WRITE_ONCE(console_loglevel, saved_console_loglevel);
 			saved_console_loglevel = LOGLEVEL_DEFAULT;
 		}
+		mutex_unlock(&console_loglevel_lock);
 		break;
 	/* Set level of messages printed to console */
 	case SYSLOG_ACTION_CONSOLE_LEVEL:
 		if (len < 1 || len > 8)
 			return -EINVAL;
+		mutex_lock(&console_loglevel_lock);
 		if (len < minimum_console_loglevel)
 			len = minimum_console_loglevel;
-		console_loglevel = len;
+		WRITE_ONCE(console_loglevel, len);
 		/* Implicitly re-enable logging to console */
 		saved_console_loglevel = LOGLEVEL_DEFAULT;
+		mutex_unlock(&console_loglevel_lock);
 		break;
 	/* Number of chars in the log buffer */
 	case SYSLOG_ACTION_SIZE_UNREAD:
@@ -1855,6 +1867,34 @@ SYSCALL_DEFINE3(syslog, int, type, char __user *, buf, int, len)
 	return do_syslog(type, buf, len, SYSLOG_FROM_READER);
 }
 
+#ifdef CONFIG_SYSCTL
+int printk_sysctl_set_loglvl(const struct ctl_table *table, int write,
+			     void *buffer, size_t *lenp, loff_t *ppos)
+{
+	loff_t pos = *ppos;
+	int old_loglevel;
+	int err;
+
+	if (!write)
+		return proc_dointvec(table, write, buffer, lenp, ppos);
+
+	mutex_lock(&console_loglevel_lock);
+	old_loglevel = READ_ONCE(console_loglevel);
+	err = proc_dointvec(table, write, buffer, lenp, ppos);
+	/*
+	 * Implicitly re-enable logging to console. Under SYSCTL_WRITES_STRICT,
+	 * non-zero-offset writes return 0 without updating table->data, so
+	 * require either offset 0 or an observed console_loglevel change.
+	 */
+	if (!err && *lenp &&
+	    (!pos || READ_ONCE(console_loglevel) != old_loglevel))
+		saved_console_loglevel = LOGLEVEL_DEFAULT;
+	mutex_unlock(&console_loglevel_lock);
+
+	return err;
+}
+#endif /* CONFIG_SYSCTL */
+
 /*
  * Special console_lock variants that help to reduce the risk of soft-lockups.
  * They allow to pass console_lock to another printk() call using a busy wait.
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index f15732e93c2e..a2c204320898 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -25,7 +25,7 @@ static const struct ctl_table printk_sysctls[] = {
 		.data		= &console_loglevel,
 		.maxlen		= 4*sizeof(int),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
+		.proc_handler	= printk_sysctl_set_loglvl,
 	},
 	{
 		.procname	= "printk_ratelimit",

base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
-- 
2.43.0

