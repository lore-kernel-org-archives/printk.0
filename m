Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043030;
	b=wn2Iay0CwcCmUN/crh4wkZH/3OosbimOkvyzeBdSvAeZIJHjPbQKNX8t0ro7Jhre3v5u
	 g0Uc6As8tJ6yCCemHF4vJqIrd+jC0TynQKDE8Cg1IWLOtPJGffE4JqpuNXAfjeDf7JuwS
	 aKp4DHQ/j0jmC5BUeso/PSARKgoUeE0UTV+w/18c3lOz4tcq+JesQs7oWysZfev9Py8/f
	 kW5M5dw1EqzRmA/UrixNr73f5Bh3KYduv98IorkCoh2GUv96NZtG+UcyDblhOCyBc6GEr
	 7qnKoMCllEXQQliqp6/CbDsTIs5UyOjK/FjZAsxkqulL5tG0k+vCU9tjKsqGz38nGPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043030;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5x98UPaGgzT43cg9tAkkJmDC1rq7XTi3UWTY4DtEVEw=;
	b=mdYt7TYdzeDaTbRB5Y3bsi8JH1oMniVzgxorc7r+2FFqGNxNtbTBJHTzsvBwcQkL+Tnw
	 eNU/gvzA4fyMTPXsVImMUOGnkVza13ltPqh+OWMcUZXiU63+wBXeu9EHG/6wTmND+/Kdv
	 LnZ6iw5lNgxwd6TGuB1cQWcRcyevMMqoA94FPsvYTtSVfcOD2TsSzXFO/RarotiCX9X8W
	 M1bBkKZZ8XMmnPJnE9ClyCzKfWA01uCvaGp8e+Befq5a+S7dHk9XBKr/IyM4FbWmolJEn
	 AXEnqsjPGxyBGAKO2PXPbscafJhjmqY/5KyburSf9O6gqHl1BWtSUyDRnxyh1JIiboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=m8P6JlYJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aYYNHIYM;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54F606A337
	for <printk@lists.linux.dev>; Wed, 18 Nov 2026 23:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB54F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=m8P6JlYJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aYYNHIYM
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x98UPaGgzT43cg9tAkkJmDC1rq7XTi3UWTY4DtEVEw=;
	b=m8P6JlYJEo560wZUjoaUpMsLM0kHNQBwT51w0i9J+9YpQsypvbec+0tkuDZP+edGCklZRp
	wSxqKdVm1YTgSn3wxJTXatJpnc+odskyxfPwERpH6Ja3b1aEHQOZMNPIVRgmVEl+CXOo5L
	6uJ/69TwsTzKn2T56NmCcZljsTEakeL0Z/7caB4R96GUN4edJJ1Z7pL/nmmOq3tYK3LXB9
	Bj5Jl0HB5XsZAG9lq7MCcRVMn4JuLRyD7RqvayJl5qG8uCftn5WskdVVJRjhGNkxeZKzF0
	HY0Iq5BcGrOKZRll7rhd7e+Gc7Ddgwt88DRaWGfgqWCto+wOWOQpdd5kzMlQpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x98UPaGgzT43cg9tAkkJmDC1rq7XTi3UWTY4DtEVEw=;
	b=aYYNHIYMbinyOa9GG3ubGFthVqDU8435zzG7bbKjMsYHsUDNS/eXHznpggPusxKGHX0/5L
	2Pin/D8592PTfQCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk v3 3/7] printk: Move unsafe takeover check out of console_is_usable()
Date: Thu, 19 Nov 2026 00:09:39 +0106
Message-ID: <20261118230345.808560-4-john.ogness@linutronix.de>
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

