Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278970;
	b=YMFEGgXaOUcV/rmlRUqe0Ho3cb7vqKE9RmvB8pJ42EjMoU1pVmJ1ICBrpnVmdWKnltHS
	 gK2Qtk4w+HpQb4G0dx2OIaeeTt5sCOkhL/rPU+hmNUCrjqMCnfrsIFtUQkNFAsqueCLAi
	 61Nzk5bcUdb1DgjjH5yrfboN6pgOKnnQDSHwdNG4NLt7WqkLASehD5wJdLzODwwdM3yDr
	 B27MyNk65HB271FRBJD9Lmoq2jBndCmbaacDgXKjA/oVgzHNC+4l9QQ0API1SpERcqlj8
	 gMacm8XefEaUjq5P5YJf4aQYfk8hNe+8v2gkBZL0TOctoBxobQXzhQ0+QOB+7a7BE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278970;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EDQ/Bv0EKc6YV/NWFzsUR1sguRZd0XohMFdCN/XmTyg=;
	b=DFvdKpyZwwN0ZGUk7j7TFCTyxOMueMiLlVX/Y3U1JN1ByCYFOY9GOMVMfgMV/1dOgQH1
	 m+RN5qC06WJAqje1d+VlvJFl/3WmFKcz0sjYxowN3PFww6+cCYddm1p+6ur1a29RnFfte
	 Ly+PQ3r4Ay+a0embx8x73t557vn5BaOCvsRv8jJtl2DXmRQ86c2L1hHjOm+yeStARA6U3
	 tfR6/FbB87QZXOy4txxja/Jp1776Z7s/tM/aNKJSFimsXheHw96eNfxowAVhO0jAPPRei
	 y95piKxds2thgIA9eYeEtQDPR2CWVRXvOd836+59o84qQASxM/Ptda5/WXPYD0kdEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GswljoSa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lJ03ZMbX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28F2606A69B
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A28F2606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GswljoSa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lJ03ZMbX
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDQ/Bv0EKc6YV/NWFzsUR1sguRZd0XohMFdCN/XmTyg=;
	b=GswljoSaIKK7FTexe3jnnXhzQTZWDo2vXVpsgxP5AeZNnZYc00+gzmOtDuL87IxytV7o+X
	6HUT5g8o5JZZfXgk5DB66Gda5BSUqttHz3BDADYNYW9zTxpCCgyPcb+olMkeZLJi98U/9J
	C7e0zgbGX85jpHbsAUFCTzepVn3jcOB6sdBUPD2kAojeo/9n42SU5RAjvQa1AjGrCiPg9W
	wp7UCaeVYmQa8WvUyzgEOggNY915UN1sJPylOI4pLAeenYnoiXQ6xecKXqtjJ5q5D+RIOL
	31kk5Re7SZ+Bf81EoYX4t2m2K4EK8PISLot0wErL5oVq7vsYlHlz+dY0NlYAAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDQ/Bv0EKc6YV/NWFzsUR1sguRZd0XohMFdCN/XmTyg=;
	b=lJ03ZMbXvgWyp1jv7gu0KXMuHYXGRGO61r+ZojzjJwLBWmb8mZQeyRiuIUjgjlo1osg5IJ
	Lj9y9UOnb/E2gxCw==
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
Subject: [PATCH printk v4 8/8] netconsole: Perform unsafe flushing on panic and emergency restart
Date: Sat, 21 Nov 2026 17:41:56 +0106
Message-ID: <20261121163557.963029-9-john.ogness@linutronix.de>
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

As a legacy console the netconsole would perform unsafe flushing
during panic and emergency restart. With commit 7eab73b18630
("netconsole: convert to NBCON console infrastructure") the netconsole
is now an NBCON console, however it uses the CON_NBCON_ATOMIC_UNSAFE
flag and this prevents unsafe flushing except for at the very end of
panic().

Enable default unsafe flushing policies to allow the netconsole to
perform unsafe flushing during panic and emergency restart.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/net/netconsole.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 267254f046de9..3300b2bbbd413 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -2695,6 +2695,7 @@ static void free_param_target(struct netconsole_target *nt)
 static struct console netconsole_ext = {
 	.name = "netcon_ext",
 	.flags = CON_ENABLED | CON_EXTENDED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
+	.allow_unsafe_policy = NBCON_PANIC_RESTART_FLUSH | NBCON_EMERGENCY_RESTART_FLUSH,
 	.write_thread = netconsole_write_ext,
 	.write_atomic = netconsole_write_ext,
 	.device_lock = netconsole_device_lock,
@@ -2704,6 +2705,7 @@ static struct console netconsole_ext = {
 static struct console netconsole = {
 	.name = "netcon",
 	.flags = CON_ENABLED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
+	.allow_unsafe_policy = NBCON_PANIC_RESTART_FLUSH | NBCON_EMERGENCY_RESTART_FLUSH,
 	.write_thread = netconsole_write_basic,
 	.write_atomic = netconsole_write_basic,
 	.device_lock = netconsole_device_lock,
-- 
2.47.3

