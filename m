Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043029;
	b=FMgJsji9dDjh37lcDNK9rTHNCnYzRj3HXKEZdxl2dYF8dqHasAU/ym5t9Nv7//JQJLjy
	 ERkmp1xfy80IfOchJ62LDNaKFqjEVERTVADdYnm/IC4ogUxlVhOw6nvK8taNI6i6xiqEF
	 3pglIxbrnqgFLpBS/GM4WpsSPRvo52BOvPDWhMnTEjn5hFCP6+bg3OoNWNQmYA4OCjkGc
	 2kFaPQ6Mn+Izu5h5TNkt0f0ahXHOuVFcb/12qKT9rvEGByXqOlCrvYoIqG8/oVWsOT7J/
	 MT3TKDVwixhvw0YEUOL3lNlH5utGI05+yULk2+jS+ELKFfbCiRUF3jmnnkMRAq4uY0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043029;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=afnjPJUTSG1r9uCzQyOfgjhsmaGX4UxcB8hhrbxjjS0=;
	b=Bt6vzXirVVUCShEPUrh4kqbPS1zb1Q/tuke9E8E9G3aBVftE7Gfna5j6z1HttIQvcHwn
	 5ZxUWHwmjPHzIzeNxz8YWCyZ9JfAPhNUrK8bA9IAivDg171zNRdXjnw5qZEHa0Jg84oN9
	 wRMd5yCy8E1w/LOHijampjTMRoHv3gKFT4PkmLeHLNS9ejro/9v3TUdwfdLEGlZ/yBt8M
	 2Z5tyv7GE6/13N4CtI04MT9ltvjI3+NPHCV0g3YJqajxh5xf493eKUjZ4fnn2ukKoZ60g
	 TKA8v2Iu0/VXh/lbylTq8DoiNnPNHNWraMbHMmFJounAekVAVTkNccceEwzjaR9xdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2KcbWV8X;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ikOwLpec;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E4606A32F
	for <printk@lists.linux.dev>; Wed, 18 Nov 2026 23:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98E4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2KcbWV8X;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ikOwLpec
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afnjPJUTSG1r9uCzQyOfgjhsmaGX4UxcB8hhrbxjjS0=;
	b=2KcbWV8XkVHQkwNiJ/JKQhcdeXbDAaq6j1xTRP1MIMC8HMzNVtbMhWD4HHMC49r44DoQUJ
	2obLjDRFiifcp9bwWl3XCyRROaa5fqPVeUbLoBhLO6t3qjpkJd3qClDGmMk/mT7IdSbiAk
	82zSK/wn6wBW9zq5xegZ9OeKsfUlyijtjCRrKzXgwHOn9ENimam5qVfUjTY4DSr4K15rRD
	fJnMeHZ5e9UwUDWcKK/xVUcaq6HQ14ZBDdRysNwWXh5Hr1RN3hNdhTwOtyaIbatEhZ6BZV
	hkU7l9Rk1UZdOzrB4pPCLZt+IcqgDrw3/HPMlpFawTzgv4gkmp+2xVbzaey+gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afnjPJUTSG1r9uCzQyOfgjhsmaGX4UxcB8hhrbxjjS0=;
	b=ikOwLpec7zXL9OW1N8f3zRrL2H6YuLO32wokKGSLpw7yY85xTUZNHSS6ey4NOifZgkVq7Y
	tJMQw9ZjB8s/nmDw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Gal Pressman <gal@nvidia.com>
Subject: [PATCH printk v3 1/7] printk: Introduce and specify flush reasons
Date: Thu, 19 Nov 2026 00:09:37 +0106
Message-ID: <20261118230345.808560-2-john.ogness@linutronix.de>
In-Reply-To: <20261118230345.808560-1-john.ogness@linutronix.de>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
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

Prepare for per-console unsafe atomic flushing policies by
introducing enum pr_flush_reason to classify various reasons
for performing a printk backlog flush. Specify the reason for
nbcon_atomic_flush_unsafe().

Propagate the reason down to __nbcon_atomic_flush_pending(),
where consoles are selected for atomic flushing.

Update the nbcon_atomic_flush_unsafe() and
__nbcon_atomic_flush_pending() call sites to specify the flush
reason.

Note that PR_FLUSH_RUNTIME is used for cases where the reason
for the flush is not clearly defined.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/printk.h | 17 +++++++++++++++--
 kernel/panic.c         |  2 +-
 kernel/printk/nbcon.c  | 11 +++++++----
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd4..68cf51db5f0ea 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -145,6 +145,19 @@ void early_printk(const char *s, ...) { }
 
 struct dev_printk_info;
 
+/**
+ * enum pr_flush_reason - Reason for a flush
+ * @PR_FLUSH_RUNTIME:	A flush while the kernel is running
+ * @PR_FLUSH_HANG:	The kernel is ending and will enter an infinite loop
+ *
+ * Flush reasons are used to determine if unsafe atomic flushing should be
+ * performed, based on individual console policies.
+ */
+enum pr_flush_reason {
+	PR_FLUSH_RUNTIME,
+	PR_FLUSH_HANG,
+};
+
 #ifdef CONFIG_PRINTK
 asmlinkage __printf(4, 0)
 int vprintk_emit(int facility, int level,
@@ -207,7 +220,7 @@ void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
 extern bool nbcon_device_try_acquire(struct console *con);
 extern void nbcon_device_release(struct console *con);
-void nbcon_atomic_flush_unsafe(void);
+void nbcon_atomic_flush_unsafe(enum pr_flush_reason reason);
 bool pr_flush(int timeout_ms, bool reset_on_progress);
 #else
 static inline __printf(1, 0)
@@ -318,7 +331,7 @@ static inline void nbcon_device_release(struct console *con)
 {
 }
 
-static inline void nbcon_atomic_flush_unsafe(void)
+static inline void nbcon_atomic_flush_unsafe(enum pr_flush_reason reason)
 {
 }
 
diff --git a/kernel/panic.c b/kernel/panic.c
index a4dbb6b8cd2bf..21d0ca892c64f 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -765,7 +765,7 @@ void vpanic(const char *fmt, va_list args)
 	 * Explicitly flush the kernel log buffer one last time.
 	 */
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
-	nbcon_atomic_flush_unsafe();
+	nbcon_atomic_flush_unsafe(PR_FLUSH_HANG);
 
 	local_irq_enable();
 	for (i = 0; ; i += PANIC_TIMER_STEP) {
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 5f8afaca88665..72fb49ade6fe5 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1652,9 +1652,10 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 /**
  * __nbcon_atomic_flush_pending - Flush all nbcon consoles using their
  *					write_atomic() callback
+ * @reason:			The reason for the flush
  * @stop_seq:			Flush up until this record
  */
-static void __nbcon_atomic_flush_pending(u64 stop_seq)
+static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_seq)
 {
 	struct console *con;
 	int cookie;
@@ -1688,20 +1689,22 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
  */
 void nbcon_atomic_flush_pending(void)
 {
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME, prb_next_reserve_seq(prb));
 }
 
 /**
  * nbcon_atomic_flush_unsafe - Flush all nbcon consoles using their
  *	write_atomic() callback and allowing unsafe hostile takeovers
  *
+ * @reason:	The reason for the flush
+ *
  * Flush the backlog up through the currently newest record. Unsafe hostile
  * takeovers will be performed, if necessary.
  */
-void nbcon_atomic_flush_unsafe(void)
+void nbcon_atomic_flush_unsafe(enum pr_flush_reason reason)
 {
 	panic_nbcon_allow_unsafe_takeover = true;
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(reason, prb_next_reserve_seq(prb));
 	panic_nbcon_allow_unsafe_takeover = false;
 }
 
-- 
2.47.3

