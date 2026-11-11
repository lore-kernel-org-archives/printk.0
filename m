Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421190;
	b=dc8TQQvVdGiBdq/Eixgazei/C5KwUAKuwejWyOxyu1RIZv93E+YoHIWPBsU4LNSoJBTg
	 ISP9s9J844Qplt54xlda4EeqkcRY8Io2FF/Suaj+7imh4poRXkw3YzHuseTNzp46URkaS
	 uVcVbiFp65xa7DFnsaZyGXUuiDu1orxwfl5YaVhHIGFUQnaxSdZDR/JWSMYIV8MwMPTAQ
	 loTyK8fl90VsOA5CGHIDtCtUDPxKzFp8ZexhPyPeogp1jf4zEWc0U2pRNLBzxok0+6ySI
	 yKT4HT5N88eKr/fbo27sO+RyQbg/RpthNdZsCgxo1sPY78Mxq1pqhWzt19yZkxGcGOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421190;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+Dj0snY+kfTXfG+VRMdB3cQPdoVXWSwHQgeJoQUXLU=;
	b=4rPkk17eNutZRDUQZS093yKu2OH0FXZ2btVpPlWYD18mZcQ1e5NCkg7wsknnSH9ON98V
	 RlqyPdW2tCgXlZjHB/TFcEEnFm7Q8yrjIYOY4jJRKBB8gCa3DqX2TIJEt2+C7h5JR3ctz
	 1PTMKiBbxno0sBR75AfsvnTGaoKM3aISW0iWQeAaaDhSKtXckCTcYL/QSL8OzR9ijQh0B
	 OZy4rvVrfVZfKl/+m1BlKnkf1XEr15Aqa0iecC4Z05MgUdm8zU0bWmML8c0liVDqZEnvu
	 38zqKIKkv/K9b+wj2RPjPFMJqGzrNNc6SpLE1GNldGkF5OP9Dp+S1E6+0XqJB1sxRxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="LwRHuO+/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qG3gFHcN;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C0606CB2F
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 18:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60C0606CB2F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LwRHuO+/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qG3gFHcN
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794421188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+Dj0snY+kfTXfG+VRMdB3cQPdoVXWSwHQgeJoQUXLU=;
	b=LwRHuO+/ZN3tMg7NzfH3ajl6QJbbQDyuwnRI8WUxJd3BZtXtXxqtT+geKnGJT41TtnFF8v
	mVdarGKNZnjTMwmzvZfklNpb9HUKskCl/8+IFYsDEPMV7oevfPtPVaJdd+P2zIKiPm7q73
	iHPsYb4KZ0MDwS2RyGtZslnuIRQFFl7ZKXwvYhkfQ1raBVU8ltwEEClmA9x4OsTbGxFqsn
	sNUkYf2Reh98B7+UoP08JUzlsHJgW0Iud8i85UD/nY7/ZR5xXTKRiZU1wK7pqpa/SyfagG
	yWjOoEJdyEZx2hEjd46ZW4J17hyi1zm9HsyQ5pWUylsvKkTm268Q/cM7rv5v/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794421188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+Dj0snY+kfTXfG+VRMdB3cQPdoVXWSwHQgeJoQUXLU=;
	b=qG3gFHcNdGqoZspX4hgqVVSm+WQcAQnmGZuHf1C0UKAY+NZ9pcFr+x5Z8KWIHv6Onlm/Sn
	5U6rMEfxApR41TCA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH printk v2 6/6] netconsole: Always perform unsafe flushing on panic/kdb/restart
Date: Wed, 11 Nov 2026 19:25:22 +0106
Message-ID: <20261111181942.593695-7-john.ogness@linutronix.de>
In-Reply-To: <20261111181942.593695-1-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
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

As a legacy console the netconsole would perform unsafe flushing
during panic/kdb/restart. With commit 7eab73b18630 ("netconsole:
convert to NBCON console infrastructure") the netconsole is now an
NBCON console, however it uses the CON_NBCON_ATOMIC_UNSAFE flag and
this prevents unsafe flushing except for at the very end of panic().

Enable unsafe flushing policies to allow the netconsole to perform
unsafe flushing during all panic/kdb/restart variations, just as it
did when it was a legacy console.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/net/netconsole.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 267254f046de9..6c1587958e915 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -2695,6 +2695,8 @@ static void free_param_target(struct netconsole_target *nt)
 static struct console netconsole_ext = {
 	.name = "netcon_ext",
 	.flags = CON_ENABLED | CON_EXTENDED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
+	.unsafe_flush_flags = NBCON_PANIC_FLUSH | NBCON_PANIC_PRINTK | NBCON_KDB |
+			      NBCON_NORMAL_NOTHREAD,
 	.write_thread = netconsole_write_ext,
 	.write_atomic = netconsole_write_ext,
 	.device_lock = netconsole_device_lock,
@@ -2704,6 +2706,8 @@ static struct console netconsole_ext = {
 static struct console netconsole = {
 	.name = "netcon",
 	.flags = CON_ENABLED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
+	.unsafe_flush_flags = NBCON_PANIC_FLUSH | NBCON_PANIC_PRINTK | NBCON_KDB |
+			      NBCON_NORMAL_NOTHREAD,
 	.write_thread = netconsole_write_basic,
 	.write_atomic = netconsole_write_basic,
 	.device_lock = netconsole_device_lock,
-- 
2.47.3

