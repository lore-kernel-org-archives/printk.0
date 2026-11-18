Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043030;
	b=1CyrvIufiUXI8LZHb1wUs5Q13dk19k8R4Is/huPuUpvaaXo/Y9iO7f6NTVbDyHbL5hQH
	 wipSBmdvz3Vrq7kJRIBDRZkkDrA5O9Bp0dzNEVLE6PdiqO5bsZdyba4wtds0YVYypBJVk
	 nx2rvll3mFoeU+K6Ra+ZvL1wf0eAOln+fEbo05Xah/68vWaX1dl4kKU4MaTXhH0+OyvSF
	 bJmsM3Obvjy/r9t7sOD9Lx6zkhT+zmYLYjulJ42aIoFyGIZGXfBMQElPg9dzEdkSkK0QQ
	 k/THBUCJ0QfnDS6NmB838SRtN3qyxhiPQk/6D9PK1TduFMqpP1iLeNzu7pozT1Uierw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043030;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fFzROWrJ/jGldNzenqyw6kMNrCkutESWp3uY2xz/OSg=;
	b=QJpJjF5ypHK0pz4y6E9JaeO7N5Ok5ZsAiDM7RB2nA+oB4tbl+j2coVywmFZY1kcKIkX5
	 kpGXO6m6+mCDvb54qv5n/yvQ3Hy8Mk2tIwhEdHdufHPJWCcBuKLUd+bFQaW4Rw2nIy+aa
	 KfIhjk2NDo+p1y5ayMxGKeIZS5wCo3o2wPAYF4hyXCoZ46yTngwRQY7X1GCmU+fNy0vaq
	 DoFoOp1blCUzXAb5HWIzupm/Ri/+Id5+gNs+F0A2jhs3AZh67O0qjYMNjL20mw/mjPBfG
	 VVX6ZRJ2bI8S535FXEui8QG+PQAPeICF4nZ4IjpFjzjD8AOk19OmVG4gaoool5hdCMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zex0vZrX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kcoBttxi;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF94606A331
	for <printk@lists.linux.dev>; Wed, 18 Nov 2026 23:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF94606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zex0vZrX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kcoBttxi
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFzROWrJ/jGldNzenqyw6kMNrCkutESWp3uY2xz/OSg=;
	b=zex0vZrXI6lt13dtFOlIM671A+F9kfngxy+HAxTRdBn7ynHw/M8IIjIhydlfBxGJ8KbX2c
	qvzjERZS2l+0Vvr8DmeBAByAf4pkAb1KeIEX1LvbO94G5CrtplJ3/gmTwDmzFhUX5Ce/wy
	FPwzw4CZWGUL7XDKyD5YQhge+TopEiDbJ1x7D1lgaxBXbDiPFyYbsxqSYmjXBVj6F/LEDJ
	N1GrUk7PEAlFb3EwBNoEp8UPLUkpsKL5UuIxUzFH565z9rdPNmqeUtcwFpbsU3ErWdyFeo
	iePEeGrGe2Es6QBzb0uELUQgBl9HxAtE39CA+dtF+IfnLX1Ci6qU8SdljYtRtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFzROWrJ/jGldNzenqyw6kMNrCkutESWp3uY2xz/OSg=;
	b=kcoBttxif5ZVRv5pDhCSKEwCjwcxHRVnPveUVNiewqXf/kXOT66RP+pS0f13SP7LJUcjsm
	iqs68geP+bEp98Aw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v3 4/7] printk: Use @reason instead of global variable to check flush policy
Date: Thu, 19 Nov 2026 00:09:40 +0106
Message-ID: <20261118230345.808560-5-john.ogness@linutronix.de>
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

