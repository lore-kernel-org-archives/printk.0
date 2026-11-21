Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278970;
	b=qS61FjaZoyIF9N6ADgFP2AqujuAeeKfNvup/FopSvmu/J8LDBHa3HGq7vcNGqAC4L3FA
	 7PrTT4huuOlNMs56Au46LLVJnFNlilQ0Zwa7AgTUh9zO9XGWZjwHMmrm6PQQlRh92/gXb
	 pWkKUPwPGiKBSTY2FygFJCa6V0gl3q/HbzGkA8ORRID5QTHyEmqgcN555MEkpVmV9xTnT
	 YXE091f8ZZeiUqL/qPqU4MCJISpVpR6a8ieJDiihqBrZViR0E4cp2H4LjN26HTsWF0isn
	 XnjYrbhHjOfMvAoVy+U8UaTjeJEVKgh7S16zJFGId/+244tC4UElvJD2ttWKTDsCA+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278970;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fFzROWrJ/jGldNzenqyw6kMNrCkutESWp3uY2xz/OSg=;
	b=vTGw1e9O+YgSuM+Wz737Ade1fEoM42XoPNxdJekkSZHu3nAmrUu6AU5vKWhaE6tywaCj
	 rZvz46wb5KVaB4MP0fWKCPtrI0efh/5J2blHSWB4sJiwuMU6F1g5rQtQEgGtZlfej+1hG
	 opwh8dCh5fzcQKlKOP+nyZQMI5W5PAYyfnz/hzaw0pZ1pYARhVjQ61QLcWWVCjEgdywq7
	 lZ9mvbV33kMqTmMBb1h2HkDQ2C94mJ2k6XOt45i5sa0TEsMvW6Oa6t85E/Ci2cJ7UKsr0
	 YDxJSceCIpbXoh07d2ys5xF1984JJXFBVXu/sBVRrL4xSZsOJ7ztGk12yN8vEn1MBeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RuNXf861;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7VsNPDSV;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B89606A68A
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B89606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RuNXf861;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7VsNPDSV
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFzROWrJ/jGldNzenqyw6kMNrCkutESWp3uY2xz/OSg=;
	b=RuNXf86116IQNbZ6Hd/4hfM1xrY/T1Rzf+I3O/72WgwCwYXl0gxUi9WQeaqibxrF6jA2rI
	8ah3JIaMKNHGp9BSBE/PZyLpuYLeN2NZPv1GlWLrraga5+PI3uOamSDJC9PVMCx6elDG/Q
	x7D06AcYOBunmrm34ED9QtugopgnK/IQlzUtokKL4yUEBvAggscfdCiVGtz9nFBOdmmzB8
	KS8UztkLjMOxWFgwnC2oHP5WU3TsWnI3txPn0V35PLSc9w5f1WWdBPP2yKunn79hGQnfDJ
	teaS2GljgcoiU9XS5ZUBSTtoIm9XJNIMGatcdh+gsXjEHVW1Qt0swrqesDKbeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFzROWrJ/jGldNzenqyw6kMNrCkutESWp3uY2xz/OSg=;
	b=7VsNPDSVZ1WodWtH57OVlsAyMc6Jep9S/Bxd48cPe/Crfdb9ZBSYWudG0f87Bxe6MamAlT
	egEMbu8oJwxBwfDQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v4 4/8] printk: nbcon: Use @reason instead of global variable to check flush policy
Date: Sat, 21 Nov 2026 17:41:52 +0106
Message-ID: <20261121163557.963029-5-john.ogness@linutronix.de>
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

Currently nbcon_allow_unsafe_takeover() is a hack, relying on the
temporary setting of a global variable @panic_nbcon_allow_unsafe_takeover
as a gate to determine if unsafe flushing is allowed. This hack works
because unsafe flushing is only performed at the end of panic().
However, this hack is _not_ sufficient if unsafe flushing is to be
allowed in other contexts.

Since at the end of panic() nbcon_atomic_flush_unsafe() is called with
the @reason PR_FLUSH_HANG, it is possible to identify when unsafe
atomic flushing is allowed using:

	PR_FLUSH_HANG && panic_on_this_cpu()

rather than:

	panic_nbcon_allow_unsafe_takeover && panic_on_this_cpu()

This allows removing the global variable hack and opens the door for
unsafe flushing to be allowed in other contexts.

Provide nbcon_allow_unsafe_takeover() the flush @reason to implement
the check.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 9073d1f258a89..c3307b5b2c922 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1453,24 +1453,31 @@ enum nbcon_prio nbcon_get_default_prio(void)
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
-static bool nbcon_allow_unsafe_takeover(void)
+static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
 {
-	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
+	enum nbcon_prio prio = nbcon_get_default_prio();
+	bool allow = false;
+
+	switch (reason) {
+	case PR_FLUSH_RUNTIME:
+		/* Never unsafe flush during runtime. */
+		break;
+	case PR_FLUSH_HANG:
+		/* Always unsafe flush on panic hang. */
+		allow = (prio == NBCON_PRIO_PANIC);
+		break;
+	}
+
+	return allow;
 }
 
 /**
@@ -1680,7 +1687,7 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
 		if (!nbcon_is_unsafe_usable(con, flags))
 			continue;
 
-		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();
+		allow_unsafe_takeover = nbcon_allow_unsafe_takeover(con, reason);
 
 		/*
 		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
@@ -1723,9 +1730,7 @@ void nbcon_atomic_flush_pending(void)
  */
 void nbcon_atomic_flush_unsafe(enum pr_flush_reason reason)
 {
-	panic_nbcon_allow_unsafe_takeover = true;
 	__nbcon_atomic_flush_pending(reason, prb_next_reserve_seq(prb));
-	panic_nbcon_allow_unsafe_takeover = false;
 }
 
 /**
-- 
2.47.3

