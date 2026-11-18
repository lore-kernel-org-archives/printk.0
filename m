Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043029;
	b=i8yl2ayhATd31maWLdX6WdpNLs71ToTs81dYuG9LL+4OOjxHkd9t9NtJBRpc1QXZdnaN
	 2CK4nCkM8igTj3WyBjN/sElpnuYCGVM2tUbO3+Oy+malRDJVj9LYCGdXYxjSNCeNa271o
	 n+VS94dimIUaYI3Kk3a4TkiQYVMTIK6S1wpryVPazCsk2rKzna+sxOGAGOPMsuOvoLiUi
	 HoIw65Jw31uWW7u6ZxCgaUH7dib7Ma9z+2bolPRVl12f473B4hzcP2+fB8kwXIKbGZrNf
	 Q8hOnbMg5cHGJNW/70sHojQNQODnGN7EJ4CGyf1tFifT9HTClaS4+X3g7E6E1PseuOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043029;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ILE73Z/UnEl0gMfRkniLVVxlKd15VPR0om1ajlkgN3A=;
	b=gkNDdOe0UdIEvTd3M4nkq1nIK0L4V14dTcVjB+SZXK1qYu/T4LabybnbV4O08/uuOdaz
	 1vKcV4vDb7eSELVes+nYNWTWYJXz5LaOIJFEOA7GSeQdcr7DaBmWnPQQOaoAS0FhlodcV
	 KjjjhFdf/UyWm5BDOljDnFuHDAvbxF5HLXtSrK83hzuOkHx39dRrQeoLaJHKPhVQRxYro
	 S/BQU0/QRmndghcAxuo86nq1w/6cRqHLBU6HWMp0tzUCV1870q6pTh0hUzY+Z8Ikr0zQm
	 SLOsDShyktQ5XlZii7SQLZSGlUt4/E4XGyd3lpggEunM0ztDRymxfr/ExTWQ3GeT6DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rEa3hh4d;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="jSlIx7/F";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB5606A331
	for <printk@lists.linux.dev>; Wed, 18 Nov 2026 23:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFB5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rEa3hh4d;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jSlIx7/F
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILE73Z/UnEl0gMfRkniLVVxlKd15VPR0om1ajlkgN3A=;
	b=rEa3hh4dc7WsxhnkBlr8e3j4i4TS9VopHoy0UjG5cpu6ntJo3YGe8OBg+tNtDzVbvPDoXu
	EeGTX81iNhQmawsiBDMEMUmUtl/8H59KhU/bbN8al0jO2SHhfqdw0CuQ8HWbIveTt+1s4D
	biTl59mo+Q9yRNNCrtzOx66csIt1FTuQzuEuxI4sQclmuTf9qUc9XpEUiBMB32sJgXuYpz
	ZWnHFuoXWnVE+z1wyfhPaPlaaAJ3UHy+CAbAdGSfb8eaYj80u3OiRSa76VFS1qt8oM0SW/
	aS83cdOE4aROe4txim3RrVc47MXISOwnwsczJBXgh2xIH92brtxVU2Tx+J99vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILE73Z/UnEl0gMfRkniLVVxlKd15VPR0om1ajlkgN3A=;
	b=jSlIx7/F2HZagnRTrK0OwMpS6NnI7Trz3aUwlp/UAo9iTMzrxpbOIQaIt0KcSzx86U2edp
	4KPuT4YiOgbXwtBg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v3 2/7] printk: nbcon: Move unsafe takeover check to higher level
Date: Thu, 19 Nov 2026 00:09:38 +0106
Message-ID: <20261118230345.808560-3-john.ogness@linutronix.de>
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

Commit 187de7c212e5 ("printk: nbcon: Allow unsafe write_atomic() for
panic") introduced nbcon_allow_unsafe_takeover() to determine if
unsafe takeovers are allowed based on the current context. The call
was placed as deep as possible, in __nbcon_atomic_flush_pending_con(),
to avoid passing down @allow_unsafe_takeover.

Now a flush @reason is available and will be used as additional
information to determine if unsafe takeovers are allowed. For
this the placement of nbcon_allow_unsafe_takeover() is too deep.

Move nbcon_allow_unsafe_takeover() up 2 call levels and restore some
of the @allow_unsafe_takeover passing. This positions the call at an
appropriate level for using the flush @reason.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 72fb49ade6fe5..7bc10dcaee7e5 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1543,6 +1543,7 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
  *					write_atomic() callback
  * @con:			The nbcon console to flush
  * @stop_seq:			Flush up until this record
+ * @allow_unsafe_takeover:	True, to allow unsafe hostile takeovers
  *
  * Return:	0 if @con was flushed up to @stop_seq Otherwise, error code on
  *		failure.
@@ -1561,7 +1562,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
  * returned, it cannot be expected that the unfinalized record will become
  * available.
  */
-static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
+static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq,
+					    bool allow_unsafe_takeover)
 {
 	struct nbcon_write_context wctxt = { };
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
@@ -1570,7 +1572,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 	ctxt->console			= con;
 	ctxt->spinwait_max_us		= 2000;
 	ctxt->prio			= nbcon_get_default_prio();
-	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
+	ctxt->allow_unsafe_takeover	= allow_unsafe_takeover;
 
 	while (nbcon_seq_read(con) < stop_seq) {
 		/*
@@ -1611,19 +1613,21 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  *					write_atomic() callback
  * @con:			The nbcon console to flush
  * @stop_seq:			Flush up until this record
+ * @allow_unsafe_takeover:	True, to allow unsafe hostile takeovers
  *
  * This will stop flushing before @stop_seq if another context has ownership.
  * That context is then responsible for the flushing. Likewise, if new records
  * are added while this context was flushing and there is no other context
  * to handle the printing, this context must also flush those records.
  */
-static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
+static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq,
+					   bool allow_unsafe_takeover)
 {
 	struct console_flush_type ft;
 	int err;
 
 again:
-	err = __nbcon_atomic_flush_pending_con(con, stop_seq);
+	err = __nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
 
 	/*
 	 * If there was a new owner (-EPERM, -EAGAIN), that context is
@@ -1657,6 +1661,7 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  */
 static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_seq)
 {
+	bool allow_unsafe_takeover;
 	struct console *con;
 	int cookie;
 
@@ -1670,10 +1675,12 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
 		if (!console_is_usable(con, flags, true))
 			continue;
 
+		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();
+
 		if (nbcon_seq_read(con) >= stop_seq)
 			continue;
 
-		nbcon_atomic_flush_pending_con(con, stop_seq);
+		nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
 	}
 	console_srcu_read_unlock(cookie);
 }
@@ -1934,7 +1941,7 @@ void nbcon_device_release(struct console *con)
 		 * using the legacy loop.
 		 */
 		if (ft.nbcon_atomic) {
-			__nbcon_atomic_flush_pending_con(con, prb_next_reserve_seq(prb));
+			__nbcon_atomic_flush_pending_con(con, prb_next_reserve_seq(prb), false);
 		} else if (ft.legacy_direct) {
 			if (console_trylock())
 				console_unlock();
@@ -2004,7 +2011,7 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
 	 * The console was locked only when the write_atomic() callback
 	 * was usable.
 	 */
-	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb), false);
 }
 
 /**
-- 
2.47.3

