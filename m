Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278969;
	b=DRj9zkh5NDbxkSPpstfUKz+Ag/JWK++SeUK2p0Gro0HFxDiRXFjjdSyYAaHi+FEfo0+P
	 Gefu3c9ilrFi0QE5Ad5uewZQHe2YHn8PmSpplc+WzZ/qbA8bcx+sIMCahtB/0JBXNYFXZ
	 OnmU5liL5QwFnJBlmq+cpiZ6Kqx8deJm6MY9nWd8hp9Xs+giGhNRk1aREtg4B8PbjNuFO
	 MFJAmTuoT9e2sRtROIUmKRx40qecA8L80bTrzf1UOwGmqlrwZ7Q82IqnCoNbdUN592yVo
	 HJRhPunbuT/i9225swnjkIEGvwtxV/ho7/IOeRPT9y+6uWUU8NMdpTcirkFOL6ds71A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278969;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ILE73Z/UnEl0gMfRkniLVVxlKd15VPR0om1ajlkgN3A=;
	b=kT+2jpEEEM1tw29Uy5QSml14is28JwAEGkYD68Cl9nkBT/qXIRrjVww4LZzcC4RPY+4C
	 HKyDFUiv5QlQIK9433XUk5OSmafjrWCX1pyrVCFppAq6mUMwFpGJznbntqDUxmeYuz+o9
	 +XbMByhnb8JITEV1jnAemJsxIUxisx+4So7xd4/PMi19UMifkT4U+KirJSAbbFKOrxx6P
	 7keBtM70bIps0IQPFRU810zbl/2rBfOudAYkWX5Ttii57/VsfIrCBl8Ecf5O6DSjEA8v5
	 qqW33/FFP0RIW+vh/u/WfEpqO5yyzvh3OLlAo3JDIBdJX4/ail/WPFJrd5FNka2plVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HDq0ClSV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3XDE0eAW;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4904D606A33B
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4904D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HDq0ClSV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3XDE0eAW
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILE73Z/UnEl0gMfRkniLVVxlKd15VPR0om1ajlkgN3A=;
	b=HDq0ClSVoyCqPSBGTd9q1Qh++E6b3rEOizZ47NW8xP3FCGpZbMoGsw7uPlk4QhAZI9/raM
	lp5oGeB9ewHScqJtRY0oBdaniCnlttcZLv0rVVkQiNBCAji1AfCIpaQmPwv0dUwuwxy8t6
	V2mwRRNw8il9Uk3semRv+Xo+nWE3TNF26I3cw9B4zJaGVoAG6ceeDpzGVDaL146bKlO5m6
	Dg6O6jxpceCbSHmtneKsItu0t7VsHNx+RXdYKdOVNF96idKyDuIgfr04Te2Vyt9CIDH2Vi
	XlHjVVsQjFrNUAr4/jof/NULIDL9tfE00wcJUyXQ866U62TC7QdThm6Y5jlQzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILE73Z/UnEl0gMfRkniLVVxlKd15VPR0om1ajlkgN3A=;
	b=3XDE0eAWYzITq59TNVo433XpmrDQMEzhNkD6mR0148fbnSJU/GwJBaZEBnO4Z1wfe5pAQ+
	ETjqyB4i4iXmDfBQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v4 2/8] printk: nbcon: Move unsafe takeover check to higher level
Date: Sat, 21 Nov 2026 17:41:50 +0106
Message-ID: <20261121163557.963029-3-john.ogness@linutronix.de>
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

