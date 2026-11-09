Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227492;
	b=lR7uv1nSHlqiTEew5WrYwuZd39AQgxa/YFGRimbxj00Cs4URCDgASJ4uDd9fiaqLGKpp
	 zEzlmhmA/DOrfJ78Y+Eyjcb5wDqPO4AXaf+h5BHH3QScF+0quf3sim5Q/TOHk7NNflBUz
	 ZEpPKbtgnYR7hcrH/ymHg5W3T+WAwuK/RL4pNABjpAJsYUrjgSNvcf+2herk6b6jz9oof
	 PuE+toYN52S5aEs0BFL24OqjtUhrkutF3KAprJCProxZXFK7LoY2vUeFQtq49oVVfNsdT
	 jfUZtZ5hu/R8USp4zDlvhPN5VD6DP7UcDTHItjs//AX9gVumQyz6Ffr4Y8s3NVsiG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227492;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fk/plgQOnNgxot4a055ybhlFy4YVqeu8EY06Tr/Xk34=;
	b=SKcZ+9xjEE6UgDL1FDq01I92cPUQw1XljU1AZ7u6aDAoZ5gn1KMHThw01z8f23VYtHLa
	 tSoZPtz7iW121yNShNMtcY7fOECZDEt2a/fbf/50pkZh2JUXRcpxDwKRS8JqZ1BBXOba0
	 YjekgywLNN3PHX8bwnpF3ByeeCWKChbAAntrm5EB7a6G0kmkDKPnOvXg6zEuJb34UBI1B
	 jJt2KY8vq13oU1RwXF3kQz/9e6wCvklSXpIFU4sVarsnsZ56ECJCLq4TLtm1VdW+piFPP
	 B5YuoK8p2p1eU/PLEZ9eD3cvkvY86yFc/HXZHPGAsr5Ih4lkFVD3zS8FfkPAxBMZyKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aXOaOHDj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/rRgVkJB";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4A606A326
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 12:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE4A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aXOaOHDj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/rRgVkJB
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794227490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fk/plgQOnNgxot4a055ybhlFy4YVqeu8EY06Tr/Xk34=;
	b=aXOaOHDjVE3a9OHIDEbmLPWmyPeC2AHMqTGfhQZXI/FNs6ZYRtVtFP3uObeQEDF6t0VYIi
	hESxRwTc+1uGuZ+LXEkqn2FUOlAnjpk9t+45t2PaiSmjqsWlRXXPpcl2Ib79e6kp/wjiOZ
	vQrKb2XDvbU9b0eWHfde7kS8ugt9x0AftFYGiQYFJTqYE8lLi5IHkl0VIuipVcQwExw2pQ
	4PkD7XcE7k/iYroAXWuiRbagm+DOf5W2tIXKmC2YJAzX6yaB892H0cbHEHbhN54eXMArAq
	ECAYJb6TT7tzvJndaoKj4OGbC47HHJQ3JJgI/XiSmwxhBlRsJ8l7KDjyxdsCGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794227490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fk/plgQOnNgxot4a055ybhlFy4YVqeu8EY06Tr/Xk34=;
	b=/rRgVkJBHJ2xpJ5vmDBdDicYsJOV9M7xJEa1qN2y5nURZv2n/C+279FlHf4UJ+oeLVDBXo
	3zd6jNjs7YfmmgCw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk 2/6] console: Introduce unsafe flush policy flags
Date: Mon,  9 Nov 2026 13:37:19 +0106
Message-ID: <20261109123127.489676-3-john.ogness@linutronix.de>
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

Prepare for per-console atomic flushing policies by introducing a
new nbcon-specific console field @unsafe_flush_flags to store the
unsafe flush policies for a console. The policies are represented
by bits, specified by enum nbcon_unsafe_flush_flags.

Currently it is expected that any @unsafe_flush_flags bits are set
prior to console registration and do not change while registered.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/console.h b/include/linux/console.h
index df23148987eeb..0841bf5e88aac 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -194,6 +194,29 @@ enum cons_flags {
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
 };
 
+/**
+ * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
+ * @NBCON_PANIC_FLUSH:		In panic, unsafe flush before kexec or reboot.
+ * @NBCON_PANIC_PRINTK:		In panic, unsafe flush on each printk().
+ * @NBCON_NORMAL_NOTHREAD:	During normal operation, when printing
+ *				kthreads are unreliable or have been shutdown,
+ *				unsafe flush on each printk() or on explicit
+ *				flushing.
+ * @NBCON_KDB:			Unsafe flush kdb output.
+ *
+ * NBCON unsafe atomic flushing always occurs at the end of panic() before
+ * the kernel enters an infinite loop. Users may choose to perform unsafe
+ * flushing in additional scenarios where the current kernel is ending in
+ * order to increase the chances of seeing console messages, even if it is
+ * not safe to do so.
+ */
+enum nbcon_unsafe_flush_flags {
+	NBCON_PANIC_FLUSH	= BIT(0),
+	NBCON_PANIC_PRINTK	= BIT(1),
+	NBCON_NORMAL_NOTHREAD	= BIT(2),
+	NBCON_KDB		= BIT(3),
+};
+
 /**
  * struct nbcon_state - console state for nbcon consoles
  * @atom:	Compound of the state fields for atomic operations
@@ -326,6 +349,7 @@ struct nbcon_write_context {
  * @data:		Driver private data
  * @node:		hlist node for the console list
  *
+ * @unsafe_flush_flags:	Unsafe atomic flush policy. See enum nbcon_unsafe_flush_flags
  * @nbcon_state:	State for nbcon consoles
  * @nbcon_seq:		Sequence number of the next record for nbcon to print
  * @nbcon_device_ctxt:	Context available for non-printing operations
@@ -461,6 +485,8 @@ struct console {
 	 */
 	void (*device_unlock)(struct console *con, unsigned long flags);
 
+	int			unsafe_flush_flags;
+
 	atomic_t		__private nbcon_state;
 	atomic_long_t		__private nbcon_seq;
 	struct nbcon_context	__private nbcon_device_ctxt;
-- 
2.47.3

