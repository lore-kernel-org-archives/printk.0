Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278968;
	b=FgPKsEyTCXoPDOby45RCWP3uufS09csfbC638Z141oRAUoTs8jB/vN7ipWpNHItGnFSe
	 zEgCJsT1LRtOrFrPDWa5qMGoOAYY7VEswz4hPSeA+CmtvsqQ44icFlxIKbukqbXv7AjVL
	 2ws7kE+tiarwAjHuk2HN9g0VUlMi9sL2KKNEiMfD6oFdK9xq/hwiNDJ8+OdRAk+8OxPCf
	 kXUiJFUsIufqkEMl7eGDF/zSzgEz2OSXV7VFt5+0KxdAg6jNTNTp4a7mt6bFOWOlCScQw
	 Fq8Q+0jxLPZvIE4EFhx19YM5EYMko06hQcPiaJkYg5IxNw3hsFlHtRGMPJ259jxwESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278968;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5x98UPaGgzT43cg9tAkkJmDC1rq7XTi3UWTY4DtEVEw=;
	b=NzwjzPu5zBcelU+7U18JIv+ur1n1y24wO/m8YiVrsduHjeB6R2zpkRGWIRuDM40bhB9U
	 AIN03I9xmJ0iFhn7eA59L0mlsXH32SN+OQTjt8H+zr1K03+6BPGXnczkxdpVD/odWMVZY
	 RQs5mqyFTxiTPrduaSjx5ygwKgHrEUTeN2ALNK4P+LXRU1AbZDC+dT8jedJSLk0oXK6Xf
	 ONOSS7iU2urQmehRlmyvM+9EJU5LzrtGmJsQ06zXpcpxuzY8uBngpt1sOE5gXCMNMDN8W
	 LpVgeEpz+0suepdZhfgGzJ0VpWtPuknGe0MZvi584QUTbzMsOleLoyg/CqzZIOZo9ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kx6TZRg6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=78JkIfWX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49079606A33C
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49079606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kx6TZRg6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=78JkIfWX
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x98UPaGgzT43cg9tAkkJmDC1rq7XTi3UWTY4DtEVEw=;
	b=kx6TZRg6nA64B73CSzJWQgOD3mtqu1KltFFGvhe36HB9M2+wVGjl8I6JzkqcUSZ0jKK6gp
	bq19DYVm56vRSv2I9FdhX35ez0GYJjXWVYAlXabV/lMuPbjXNQqCs9J1lQWcIjk2Xg/5RO
	1HQJNm6H36Ove0gaAua2HcfIO4rRW5yt+eDj6DE87LWrsA71ue69VqTlKXlPk1jM7OxO/s
	M+aC923VG/JGZLQ67ZS/JpuBwzTqXLIKo0trQ5NBCoB8zkR++7/4bZ98OQdtcjrd+1HF9m
	2Ca1t8ol0LoJ+JtrWan5lh9z1rnu6LpXFkopx3EZo6XGqdtYwCudXb6+9eKqiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x98UPaGgzT43cg9tAkkJmDC1rq7XTi3UWTY4DtEVEw=;
	b=78JkIfWXtY9k/0EdeWPTr6vMlbm9Iq4d+ee5mTMLINNOC5Ju4WBmbkL4oLm5FqMrm9Sw7h
	B/7awgQAhsy4BaDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk v4 3/8] printk: Move unsafe takeover check out of console_is_usable()
Date: Sat, 21 Nov 2026 17:41:51 +0106
Message-ID: <20261121163557.963029-4-john.ogness@linutronix.de>
In-Reply-To: <20261121163557.963029-1-john.ogness@linutronix.de>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
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

Change console_is_usable() to never claim a console with
CON_NBCON_ATOMIC_UNSAFE is usable since that is the normal use
case. This allows moving nbcon_allow_unsafe_takeover() out of
console_is_usable().

To support unsafe atomic flushing, provide a variant of
console_is_usable() called nbcon_is_unsafe_usable() that accepts
CON_NBCON_ATOMIC_UNSAFE consoles as usable. However, this adds
responsibility to the caller to determine if unsafe atomic printing
should occur.

__nbcon_atomic_flush_pending() is the only function that enables
unsafe atomic printing by calling nbcon_allow_unsafe_takeover().
Rather that using console_is_usable() to select atomic printing
consoles, use nbcon_is_unsafe_usable() and only select
CON_NBCON_ATOMIC_UNSAFE consoles if the unsafe takeover is allowed.

These changes effectively move the nbcon_allow_unsafe_takeover()
check from console_is_usable() to __nbcon_atomic_flush_pending().
This has no external functional change. Internally within
__nbcon_atomic_flush_pending() it means that
nbcon_allow_unsafe_takeover() is evaluated after the usable check
rather than during. The result is the same.

Since __nbcon_atomic_flush_pending() also knows the @reason for
the flush, this opens the door for the unsafe atomic flushing
policy to be enforced in __nbcon_atomic_flush_pending().

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 40 +++++++++++++++++++++++++++-------------
 kernel/printk/nbcon.c   | 17 +++++++++++++++--
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index df23148987eeb..227a7cf296f60 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -611,7 +611,6 @@ extern void nbcon_write_context_set_buf(struct nbcon_write_context *wctxt,
 extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
 extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
 extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
-extern bool nbcon_allow_unsafe_takeover(void);
 extern bool nbcon_kdb_try_acquire(struct console *con,
 				  struct nbcon_write_context *wctxt);
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
@@ -625,13 +624,8 @@ static inline bool nbcon_is_braille(struct console *con)
 	return con && (con->flags & CON_BRL);
 }
 
-/*
- * Check if the given console is currently capable and allowed to print
- * records. Note that this function does not consider the current context,
- * which can also play a role in deciding if @con can be used to print
- * records.
- */
-static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
+static inline bool __console_is_usable(struct console *con, short flags, bool use_atomic,
+				       bool allow_atomic_unsafe)
 {
 	if (!(flags & CON_ENABLED))
 		return false;
@@ -645,11 +639,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 			if (!con->write_atomic)
 				return false;
 
-			/*
-			 * An unsafe write_atomic() callback is only usable
-			 * when unsafe takeovers are allowed.
-			 */
-			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
+			if (!allow_atomic_unsafe && (flags & CON_NBCON_ATOMIC_UNSAFE))
 				return false;
 		}
 
@@ -675,6 +665,29 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 	return true;
 }
 
+/*
+ * Check if the given console is currently capable and allowed to print
+ * records. Note that this function does not consider the current context,
+ * which can also play a role in deciding if @con can be used to print
+ * records.
+ */
+static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
+{
+	return __console_is_usable(con, flags, use_atomic, false);
+}
+
+/*
+ * Similar to console_is_usable(), but allows atomic unsafe consoles. This is
+ * only interesting for nbcon unsafe atomic printing.
+ *
+ * Note: It is the responsibility of the caller to decide if unsafe printing
+ *       should actually occur.
+ */
+static inline bool nbcon_is_unsafe_usable(struct console *con, short flags)
+{
+	return __console_is_usable(con, flags, true, true);
+}
+
 #else
 static inline void nbcon_cpu_emergency_enter(void) { }
 static inline void nbcon_cpu_emergency_exit(void) { }
@@ -691,6 +704,7 @@ static inline
 bool nbcon_write_context_is_braille(struct nbcon_write_context *wctxt) { return false; }
 static inline bool console_is_usable(struct console *con, short flags,
 				     bool use_atomic) { return false; }
+static inline bool nbcon_is_unsafe_usable(struct console *con, short flags) { return false; }
 static inline bool nbcon_braille_try_acquire(struct console *con,
 					     struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_braille_release(struct nbcon_write_context *wctxt) { }
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 7bc10dcaee7e5..9073d1f258a89 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1468,7 +1468,7 @@ static bool panic_nbcon_allow_unsafe_takeover;
  * This is also used by console_is_usable() to determine if it is allowed to
  * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
  */
-bool nbcon_allow_unsafe_takeover(void)
+static bool nbcon_allow_unsafe_takeover(void)
 {
 	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
 }
@@ -1672,11 +1672,24 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
 		if (!(flags & CON_NBCON))
 			continue;
 
-		if (!console_is_usable(con, flags, true))
+		/*
+		 * Using variant of console_is_usable() to include consoles
+		 * with unsafe write_atomic() implementations. They might be
+		 * allowed depending on nbcon_allow_unsafe_takeover().
+		 */
+		if (!nbcon_is_unsafe_usable(con, flags))
 			continue;
 
 		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();
 
+		/*
+		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
+		 * not have an unsafe write_atomic() if this context expects
+		 * safe printing.
+		 */
+		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
+			continue;
+
 		if (nbcon_seq_read(con) >= stop_seq)
 			continue;
 
-- 
2.47.3

