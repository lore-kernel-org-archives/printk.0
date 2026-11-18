Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043031;
	b=pxJRU5scD6+k4vq1bfrIZlUK06CUzkXa8RXfVYNjgHJRgMjS3SRKZq7GcN3ykb7C/R+P
	 ww8GPto9GUorOW5BhAcam7gPGty5VRenGqTKWicbsEKAj6XXChBFVAC+lgjF4YscLY81L
	 wCckXirWvLbxetFNb8jI1EFU6097a1dYsTRQ0oxf7C4aFaxObohw1l2v9idqyvTEMKzMG
	 s0vure+D3/WQnMYtVJ/Cg6cEyQ41sZR5GthJIE7Im6ZLECjaHBg8dTJNvWOigdp0YUpwA
	 Z8Jos9leCtNJfXXI718sUDvu/FFpRZRxINtVTY/uMYxjqKrNGjMduitotAlOvG5FDfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043031;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WCRbP4pBjk7WYTZ88oaopbsnYxw7BVtfZ/OTZlVVMf0=;
	b=fo25LuDVirY6lBxv5OBqusatiVUwBI9xaPxMoQiq97PdmFbXGH7ovJSWHNqWpj1bzTWF
	 t31y58bOXww5w48bJ7dAxBP0XM0VejTd8lrObpFzGMTjpHgeTSCBxBQDa6OMbzLMe2v81
	 OTtxjpIM4DMNO+QhVZKuJGe68qxnMP6skM5Nns5oiK+6AOaOwc7frCVJNvnFE0wa04QRj
	 ZdClSM4cRIQqxbZl/wFajDeMR+5+wLoOe/cw04AKQha+RdM5alh3QmiWTMznKwX4fSl4j
	 Nv3eyHGp01+kaHjR+zov8Zr/I0cSudshKscUD6mpZrnU8+aspcDY06v5YGBcjH7Hk1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0uFOwMfW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7BIAmobv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254B60A2610
	for <printk@lists.linux.dev>; Wed, 18 Nov 2026 23:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C254B60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0uFOwMfW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7BIAmobv
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCRbP4pBjk7WYTZ88oaopbsnYxw7BVtfZ/OTZlVVMf0=;
	b=0uFOwMfWZOuCp+qZNvMAIhcfGXPwMr/peXt9B/CDop7yFvJjODV6KFL7WKjucGjP0baoaq
	tORj+fIvHnmzbUa4FxV8vZdXi1bqX3fUrj2hDjItPbIV/rIDI6jOkKL1jJ6anT+LJc9tl3
	hWfJqtRj28ooVIAzn/zwM9lr+oEr9KkS5VmwIxXsEBuweIvY9Sog5Vw3rneGW+22XSgHit
	hGuRjlOrpC1jri6vp8t6P0wo2GowhkP5WkbMgtsz36R4WJcr+fybt5D8wFT/2T2rewznPn
	FaQe7VhO8wL6fACT2LPxbE6/e0DFp4v2kaqmHebt22TOyf+UX5+Sp3oeQJyMiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCRbP4pBjk7WYTZ88oaopbsnYxw7BVtfZ/OTZlVVMf0=;
	b=7BIAmobvfCTaa1s1vkH+ydR0+kEcuQEyYwyfkzNnlUb1aQ4J6keOQEEsTSzFbW/0ST0Ini
	ZbaUrkkzKOLeIPAA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk v3 5/7] console: Support unsafe flushing for panic/emergency restarts
Date: Thu, 19 Nov 2026 00:09:41 +0106
Message-ID: <20261118230345.808560-6-john.ogness@linutronix.de>
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

Introduce a new nbcon-specific console field @allow_unsafe_policy
to store the unsafe flush policies for a console. The policies are
represented by bits, specified by enum nbcon_unsafe_flush_flags.

Define unsafe flush policies for:

	panic+restart: This is for kexec and reboot from panic.

	emergency+restart: This is for emergency_restart() when in
				the emergency state.

Define a new flush type:

	PR_FLUSH_RESTART: For flushing before kexec and reboot.

Implement the policy check within nbcon_allow_unsafe_takeover().

Since this adds support for unsafe flushing in non-panic situations,
remove the related WARN from nbcon_context_try_acquire_hostile().

Except for the removal of a WARN, no functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 20 ++++++++++++++++++++
 include/linux/printk.h  |  3 +++
 kernel/printk/nbcon.c   | 11 +++++++----
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index 227a7cf296f60..1afeb90692395 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -194,6 +194,23 @@ enum cons_flags {
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
 };
 
+/**
+ * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
+ * @NBCON_PANIC_RESTART_FLUSH:		In panic, unsafe flush before kexec
+ *						or reboot.
+ * @NBCON_EMERGENCY_RESTART_FLUSH:	Unsafe flush before emergency restart.
+ *
+ * NBCON unsafe atomic flushing always occurs at the end of panic() before
+ * the kernel enters an infinite loop. Users may choose to perform unsafe
+ * flushing in additional scenarios where the current kernel is ending in
+ * order to increase the chances of seeing console messages, even if it is
+ * not safe to do so.
+ */
+enum nbcon_unsafe_flush_flags {
+	NBCON_PANIC_RESTART_FLUSH	= BIT(0),
+	NBCON_EMERGENCY_RESTART_FLUSH	= BIT(1),
+};
+
 /**
  * struct nbcon_state - console state for nbcon consoles
  * @atom:	Compound of the state fields for atomic operations
@@ -326,6 +343,7 @@ struct nbcon_write_context {
  * @data:		Driver private data
  * @node:		hlist node for the console list
  *
+ * @allow_unsafe_policy: Unsafe atomic flush policy. See nbcon_unsafe_flush_flags
  * @nbcon_state:	State for nbcon consoles
  * @nbcon_seq:		Sequence number of the next record for nbcon to print
  * @nbcon_device_ctxt:	Context available for non-printing operations
@@ -461,6 +479,8 @@ struct console {
 	 */
 	void (*device_unlock)(struct console *con, unsigned long flags);
 
+	unsigned int		allow_unsafe_policy;
+
 	atomic_t		__private nbcon_state;
 	atomic_long_t		__private nbcon_seq;
 	struct nbcon_context	__private nbcon_device_ctxt;
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 68cf51db5f0ea..267a0a6fd23cf 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -148,6 +148,8 @@ struct dev_printk_info;
 /**
  * enum pr_flush_reason - Reason for a flush
  * @PR_FLUSH_RUNTIME:	A flush while the kernel is running
+ * @PR_FLUSH_RESTART:	The kernel is ending, but another instance should
+ *			follow (reboot, kexec)
  * @PR_FLUSH_HANG:	The kernel is ending and will enter an infinite loop
  *
  * Flush reasons are used to determine if unsafe atomic flushing should be
@@ -155,6 +157,7 @@ struct dev_printk_info;
  */
 enum pr_flush_reason {
 	PR_FLUSH_RUNTIME,
+	PR_FLUSH_RESTART,
 	PR_FLUSH_HANG,
 };
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index c3307b5b2c922..daf1fe8522117 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -557,10 +557,6 @@ static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
 	if (!ctxt->allow_unsafe_takeover)
 		return -EPERM;
 
-	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
-	if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
-		return -EPERM;
-
 	/*
 	 * Check that try_acquire_direct() and try_acquire_handover() returned
 	 * -EBUSY in the right situation.
@@ -1465,12 +1461,19 @@ enum nbcon_prio nbcon_get_default_prio(void)
 static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
 {
 	enum nbcon_prio prio = nbcon_get_default_prio();
+	int unsafe_policy = con->allow_unsafe_policy;
 	bool allow = false;
 
 	switch (reason) {
 	case PR_FLUSH_RUNTIME:
 		/* Never unsafe flush during runtime. */
 		break;
+	case PR_FLUSH_RESTART:
+		if (prio == NBCON_PRIO_PANIC)
+			allow = (unsafe_policy & NBCON_PANIC_RESTART_FLUSH);
+		else if (prio == NBCON_PRIO_EMERGENCY)
+			allow = (unsafe_policy & NBCON_EMERGENCY_RESTART_FLUSH);
+		break;
 	case PR_FLUSH_HANG:
 		/* Always unsafe flush on panic hang. */
 		allow = (prio == NBCON_PRIO_PANIC);
-- 
2.47.3

