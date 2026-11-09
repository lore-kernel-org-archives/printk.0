Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227494;
	b=ZkyDXfUdLud+dA/n4m7KrQqn0eaZFmoD0nfU07PQoP8cpk0axnldKaIJ+isMufhuUGdC
	 RcCLu4RLjpa2NCQo2rzE3WKEdacam6V9EHEB6s855mlYf5cA97+xYJ+Mw8vRkqr/nQamz
	 8VnQ3qOJj9FCVpnuuGf68Nl5ygjZn+tHiQYJdajhuS4kimhrSffC6c9tudHiX5oTx5hdx
	 Y6P/cpnX2OORg8uMihYASdX4bcI2JqHvG2iyYKHjrOAVBjuOjO+nwH8+nQ+GLVekmPymz
	 9DDeoaeQyZCeaXuXiAz7sV8w7dQLS7+IHgeM+jOpgzM0MaUC28OtEa4rcO0D41nqrCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227494;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+Dj0snY+kfTXfG+VRMdB3cQPdoVXWSwHQgeJoQUXLU=;
	b=dKEJMe98fWoVxWLn+LKrp/btRacO4sB4hQeZsgkigXBxi09bDMI1lo7ECU4+3GnGQgGF
	 B2zwEigtXcE8f+waQ8vFtkwToXmD93IXRhdxppQPBJmcPV+1cfdcz94a+Wyv0H7aOGcsc
	 666sG3WFeEafazPuqPMT05w0SLAYGh7OspEUgqJO+T3KvTSRtWhlI7287sUjmCClmqbVS
	 gdt4RjAAnrRKd3RPAJ/A0ztc1YqXeC8zZMFDhDfWweL0tbHDc+ic9lH3p22xyDjIjaB9W
	 NfofbIlaxnaHRrBNjZXlW2y5QQCp6C65ieVaXROSBZ54k6EkaY1GVjBMC8vdUss7JQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YGDzl48j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6xr7PFmf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F9606D816
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 12:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220F9606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YGDzl48j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6xr7PFmf
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794227492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+Dj0snY+kfTXfG+VRMdB3cQPdoVXWSwHQgeJoQUXLU=;
	b=YGDzl48jYxHNdQWqwzNV5+QEK5o2Kg+YtE6I5R275wGjN0HYtjQdCgRd5ky/lY+rhD0Qeo
	tHw/E1efPQUfsZ/jlNeTR1oxqYCbkOZGnVg+Uq5Vv8wfKDDtqGaZn/WrDTF9WeWxAURlEB
	pcZqWoViGMQFsNmPlbCpu+DOuuflw21r0Gnh9BIpQbVgawuzs5a3FXsauNOmusnTnQ70u7
	GgNqniIODXVigg0MAmdDaZbxdtD9DtTMXx3naSCdTZlXFr2nCt4AKRzJaVPU8/roKKBt6k
	gzvy1JaX2Opas0XDVcwX4MkVopbyv50xHXVqg7JKBGjAWakNamPG8CMCDsKaEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794227492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+Dj0snY+kfTXfG+VRMdB3cQPdoVXWSwHQgeJoQUXLU=;
	b=6xr7PFmfvnfZEgJrYF2lOI1GpwHyCQZKyXHko+03Y4661Q1+t74W76iQkYV+5jIqHY/Wc4
	2HCIiZcLDXSmuJAA==
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
Subject: [PATCH printk 6/6] netconsole: Always perform unsafe flushing on panic/kdb/restart
Date: Mon,  9 Nov 2026 13:37:23 +0106
Message-ID: <20261109123127.489676-7-john.ogness@linutronix.de>
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

