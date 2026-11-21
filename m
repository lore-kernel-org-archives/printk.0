Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278969;
	b=pJ8Gpc9RL0wW1ei4N2vK78qpXu/5+hv4kbttcpft3nTgj1x0G7x3nNlRURGVTUH4V6pa
	 HHfVu4s3xAE31JJYlt9RB3r434kE0Pm0LB5XRK4iK0orQrKfmYPjzS2DSrg3Wo5fn6bxg
	 uZy9fbs8iWM9E+bVOy0hKMsAxq6yHod9oSJuovKLeKce1Hwh/d7K/WO2VR6/0zCAGZWri
	 cUiIKCri3JvWF/ZqRPr8KjdT9/6/cxB25sztRb0lBOOtcFCFVukEOR25FrEpa3z6BL2lb
	 yo6SrPt6n8U1wWsEHMWQffY8JmuhyTaM8ABSXeQWH012QKrflcEZPZ5kHUtzL9B8F0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278969;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z9IBZmZnwXSEoadPvlHYquv4hGDnw1qz+9EPd/3N5o8=;
	b=5dyHIDeYwXiWztwAwnGCym0rL8/B0bk+JnvwRVcTk9wFK8C5u89bCd1Ju76VSKmWvkXP
	 iVvjPB2vkE2QRpyQMRqGuAgDFgIVnrg+NrSOb6j3mMtuGlUYaGIfIi2n5WbY8JaKOGn5O
	 wwo+LDDpfVhQmj+OoY/EAFQXpY2B5F044Dr5FnBPaURl6K9BVvdB9oYYkyPNPjnltdrFh
	 UKBEGhbXwreb5+IF+L12n6Lx0BxNZ2foL4MC1NE1o9tz/ZlrQtNAZm7Q+XqYE+myOkwDD
	 vnMRJlIH8CfnOin77XW4qxJJr5sQZw69NkP3ausYuPDrfHDtQpvxCFOYDH3t6aH4f5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wn022isj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="F/40zTB1";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45355606A68F
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45355606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wn022isj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F/40zTB1
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9IBZmZnwXSEoadPvlHYquv4hGDnw1qz+9EPd/3N5o8=;
	b=wn022isjAnO1NO3irYxg3lZmoeD/a0JCbUC3+nd/eXBlqGE43UOcz3XBKvAdkcrnyNQRFJ
	pX1FZlrYS3XyHXurYulbKnb2UVXm45OqVcuG3sU8JFS0dRtyUz594wS4LHB9hcy7lDba5P
	dop8DZunLIn7rBl2BcVQ+08VPqfiEX6NOpkgtShikH60lDA6ZVlU2+1YTidp2FN7G2A9uV
	PMLv3WsLrqxaDEcHhTXuu8FenKgEoXoOx6Y/mOopti8iP6+oByST+4fTGVnJFUCAe8mEfR
	RhbyDek8WnGdYvmGubKUm2GFf4F40Ptn00aoZFfi8K+sEdKWKJHRJgpPc1IzpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9IBZmZnwXSEoadPvlHYquv4hGDnw1qz+9EPd/3N5o8=;
	b=F/40zTB1GG/Qm8rIzcmINErJHbJhCeP10zzRr6mrkG1oXgYLNv2nPuGkwG9gn3lQwXhnDX
	77cRWhJZzDgdENDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk v4 6/8] console: Support unsafe flushing for panic/emergency restarts
Date: Sat, 21 Nov 2026 17:41:54 +0106
Message-ID: <20261121163557.963029-7-john.ogness@linutronix.de>
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

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 20 ++++++++++++++++++++
 include/linux/printk.h  |  3 +++
 kernel/printk/nbcon.c   |  7 +++++++
 3 files changed, 30 insertions(+)

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
index 8b7483bd57188..f1789cfbd8b57 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1471,12 +1471,19 @@ enum nbcon_prio nbcon_get_default_prio(void)
 static bool nbcon_allow_unsafe(struct console *con, enum pr_flush_reason reason)
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

