Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227492;
	b=Zvb97SvYRmUVvrv+mQmffAdmjre445gDhkc/raLf160QIkWf4sQy4bbzz5DZRFGUCD8J
	 r0WC5acf8oMlji3XD2tIq2rZGpIJYUpVFOQ6wukztpVLFHZmTXO1cpb+YnIit4kHXicSK
	 f5swIT8+hlUEXmRwL/biFLKlSvB2lJVJfO0Q+DI7Z4Kbq+YF6DhuF9l0nfIZj26QjT78E
	 cTCNmSJfnCJ6lEJhBHZYstnwgeghhHuStaQNZMeZEd34EsjHh89HQose6gnKhKvlw37a7
	 CkrOcQpXU41tj/uF0aQfuQ+P8tTg45CWJWvNZOMWvR63ecoSiGloYCNh7QAinpCPFIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227492;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X9Rx8/GDdAx5BEG/6CiNrfwvlYAshELkQPfJKr3nsy0=;
	b=5KzJkLDHI7Li/r8MOek4/n7zjLMIidD4CQ+z7zqs1dhxOG+4HN7C3+5fEiBc1uxfOo1c
	 fNEvWStjT423K2ljmCRWPnc4HJ/Z+ZSLOWeAdNXoNv0J6+NnFRWVOZE0Q80x4DypcSTf7
	 poX2BhKMY017dSHUKSP+XX4EwQcmBzU8EoxRif2fsLlAzX+f0ntBfSs+d6DKh0zE7FNG8
	 WQupBH9iGgAHQe4ZgB1oifX3+q1CnGlkh2KR/yUakQ10B2WsKUntcnw6ZDhTxDxAppZKD
	 4tHXiRneA9wWUiWVqfXRFi9B2KuVJ+yD3SURWT8S4zciZ09hPBxXcCECLDEaQicFwaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UnABQQun;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cjqz+9wa;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F4D606A332
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 12:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F4D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UnABQQun;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cjqz+9wa
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794227490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9Rx8/GDdAx5BEG/6CiNrfwvlYAshELkQPfJKr3nsy0=;
	b=UnABQQun35leKXKFivdHr9+0s8G+YYT9GIdtXcWEkneYQsNdoGpZKKnHb+puTPcfgpTPdU
	aaopTz+ZXAnQkhq6kHcJ7PYH8FWw/bS5AyuE+lHbnwLbJzVAllpH3Pb7xUqae6p3H6lEbf
	pX8J1HtlSu0WsFj493hyhmipuGOBJxD9b7IDm3z84DvItvO4f4fp84vudUGHla7PijGqyI
	k93349Vg85ELfeYkb0cv8nkSf3WXwt4ret7jlKwfLZ2dm9CgcyxT14pwIV0EBL8kfZHWdU
	au6Uk9PHGnfH42EClAkzMfbG0vSvVWrPRY1Wj6OeXV71fix0EiV0bJaCOJI6vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794227490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9Rx8/GDdAx5BEG/6CiNrfwvlYAshELkQPfJKr3nsy0=;
	b=cjqz+9wawO4tSM1jyX8cq+vOY2ObsgjoAsuY+7XJDlGUft8UehNdMabztD2DZDRt8CgU82
	1NX4YTSlaelHuCBg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk 3/6] printk: Evaluate flush policy in nbcon_allow_unsafe_takeover()
Date: Mon,  9 Nov 2026 13:37:20 +0106
Message-ID: <20261109123127.489676-4-john.ogness@linutronix.de>
In-Reply-To: <20261109123127.489676-1-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
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

Currently nbcon_allow_unsafe_takeover() is a hack, relying on the
temporary setting of a global variable @panic_nbcon_allow_unsafe_takeover
as a gate to determine if unsafe flushing is allowed. This hack works
because unsafe flushing is only performed at the end of panic().
However, this hack is _not_ sufficient if unsafe flushing is to be
allowed in other contexts.

Allow unsafe flushing in other contexts by modifying
nbcon_allow_unsafe_takeover() to take a console a flush reason as input
and, based on the unsafe flush policies of that console, determine if
unsafe flushing is allowed. This also allows the global variable
@panic_nbcon_allow_unsafe_takeover to be removed.

Remove the hard-coded policy for CON_NBCON_ATOMIC_UNSAFE from
console_is_usable() and implement that policy logic within
nbcon_allow_unsafe_takeover().

Note that this changes the flushing flow for CON_NBCON_ATOMIC_UNSAFE
consoles. Rather than console_is_usable() reporting that the console
is not usable, __nbcon_atomic_flush_pending_con() will report that it
is unable to acquire ownership.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 11 ++----
 kernel/printk/nbcon.c   | 79 ++++++++++++++++++++++++++++++++---------
 2 files changed, 64 insertions(+), 26 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index 0841bf5e88aac..8f5097e7f4741 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -179,7 +179,8 @@ static inline void con_debug_leave(void) { }
  * @CON_NBCON:		Console can operate outside of the legacy style console_lock
  *			constraints.
  * @CON_NBCON_ATOMIC_UNSAFE: The write_atomic() callback is not safe and is
- *			therefore only used by nbcon_atomic_flush_unsafe().
+ *			therefore only called when allowed by
+ *			nbcon_allow_unsafe_takeover().
  */
 enum cons_flags {
 	CON_PRINTBUFFER		= BIT(0),
@@ -637,7 +638,6 @@ extern void nbcon_write_context_set_buf(struct nbcon_write_context *wctxt,
 extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
 extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
 extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
-extern bool nbcon_allow_unsafe_takeover(void);
 extern bool nbcon_kdb_try_acquire(struct console *con,
 				  struct nbcon_write_context *wctxt);
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
@@ -670,13 +670,6 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 			/* The write_atomic() callback is optional. */
 			if (!con->write_atomic)
 				return false;
-
-			/*
-			 * An unsafe write_atomic() callback is only usable
-			 * when unsafe takeovers are allowed.
-			 */
-			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
-				return false;
 		}
 
 		/*
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 935fd6b86bac7..513bfd399858c 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1453,24 +1453,60 @@ enum nbcon_prio nbcon_get_default_prio(void)
 	return NBCON_PRIO_NORMAL;
 }
 
-/*
- * Track if it is allowed to perform unsafe hostile takeovers of console
- * ownership. When true, console drivers might perform unsafe actions while
- * printing. It is externally available via nbcon_allow_unsafe_takeover().
- */
-static bool panic_nbcon_allow_unsafe_takeover;
-
 /**
  * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are allowed
+ *					for a specified console and reason
  *
- * Return:	True, when it is permitted to perform unsafe console printing
+ * @con:	The console to check
+ * @reason:	The reason for the unsafe takeover
  *
- * This is also used by console_is_usable() to determine if it is allowed to
- * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
+ * Return:	True, when @con is allowed to perform unsafe console printing
  */
-bool nbcon_allow_unsafe_takeover(void)
+static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
 {
-	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
+	int unsafe_flags = con->unsafe_flush_flags;
+	bool in_panic = panic_on_this_cpu();
+	bool allow = false;
+
+	switch (reason) {
+	case PR_FLUSH_RUNTIME:
+		if (in_panic) {
+			if (unsafe_flags & NBCON_PANIC_PRINTK)
+				allow = true;
+
+		} else {
+			/* Only when the kthreads have been shutdown. */
+			if ((unsafe_flags & NBCON_NORMAL_NOTHREAD) &&
+			    !con->kthread &&
+			    system_state > SYSTEM_RUNNING) {
+				allow = true;
+			}
+		}
+		break;
+	case PR_FLUSH_RESTART:
+		/* kexec, reboot */
+
+		if (in_panic) {
+			if (unsafe_flags & NBCON_PANIC_FLUSH)
+				allow = true;
+
+		} else {
+			/* Printing kthreads not reliable. */
+			if (unsafe_flags & NBCON_NORMAL_NOTHREAD)
+				allow = true;
+		}
+		break;
+	case PR_FLUSH_HANG:
+		/* Always unsafe flush before hang. */
+		allow = true;
+		break;
+	case PR_FLUSH_KDB:
+		if (unsafe_flags & NBCON_KDB)
+			allow = true;
+		break;
+	}
+
+	return allow;
 }
 
 /**
@@ -1572,7 +1608,12 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_r
 	ctxt->console			= con;
 	ctxt->spinwait_max_us		= 2000;
 	ctxt->prio			= nbcon_get_default_prio();
-	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
+	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, reason);
+
+	if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
+	    !ctxt->allow_unsafe_takeover) {
+		return -EPERM;
+	}
 
 	while (nbcon_seq_read(con) < stop_seq) {
 		/*
@@ -1707,9 +1748,7 @@ void nbcon_atomic_flush_pending(enum pr_flush_reason reason)
  */
 void nbcon_atomic_flush_unsafe(void)
 {
-	panic_nbcon_allow_unsafe_takeover = true;
 	__nbcon_atomic_flush_pending(PR_FLUSH_HANG, prb_next_reserve_seq(prb));
-	panic_nbcon_allow_unsafe_takeover = false;
 }
 
 /**
@@ -1976,8 +2015,14 @@ bool nbcon_kdb_try_acquire(struct console *con,
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
 
 	memset(ctxt, 0, sizeof(*ctxt));
-	ctxt->console = con;
-	ctxt->prio    = NBCON_PRIO_EMERGENCY;
+	ctxt->console			= con;
+	ctxt->prio			= NBCON_PRIO_EMERGENCY;
+	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, PR_FLUSH_KDB);
+
+	if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
+	    !ctxt->allow_unsafe_takeover) {
+		return false;
+	}
 
 	if (!nbcon_context_try_acquire(ctxt, false))
 		return false;
-- 
2.47.3

