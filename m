Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412169;
	b=wvPb3E5eieyk9m9/M8sb/UNf2kNePCSs3WWyucQbXgQkbYVw9KGVdRwiXfRF8KL+QORp
	 Trhs13RoIGZ+dr8LFbcBtEHXK+78SxnNOgrGA4I0skz10EsAIdr1hbO3qxJE+bVs+E4yW
	 oHtteG8bCHcMDAK1NVemNZIQCSKCqX1Y38aKPD+OO3kyDoPgtk1juUqerDvpspIBTP5Ny
	 ceScddOFXnRlDwlIy/KU+3JgdSJOIZ6mA8F9M6qRpnTeioOdv31zpfUcZ1v48bQGUBSPV
	 icfULxfuujfodQPO0iDA+S08V6baCdSoibfsZESqP3PWKh8r5r2stnXybFCmyPV+I0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n/olX1ECWtvPiVGgVf9lD7wfSWXuiytEwuoy8qrBu+8=;
	b=DD0kE/ptaLc68jsutT552G5DjWqC/ja7UtZur60r1LPEiwqAgkFheYuMZOfz7AXqn6Yn
	 8QhKOpfm/b29JCTIP7ZiqR6+/nQRKG93Hy7Rwl1xTeLsarowM4UBaJnHnRMSKMj80cyhT
	 m5Tl7Fsyal8TDNNSl2VwMnmcdnMTz0GOcnzTlVh1SO/XM4v/37hD/pFT9cOQUcFxhhJzr
	 f9llQSKBay/ROIjRrRMP9cE+X6QFKb2am8gASmZrCBZXzadKkkoUBNWd6NrIbQ1H26N5a
	 Q1/3my7PUDaGsGAydAktRF1THjUUV0QCYPqu507Bd066bU2fcHLaYpIVKrvAyHV36hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=R9javIIa;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16C606A326
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B16C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=R9javIIa
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490a0e72588so1838551f8f.3
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412167; x=1795016967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/olX1ECWtvPiVGgVf9lD7wfSWXuiytEwuoy8qrBu+8=;
        b=R9javIIakNcBjs6YdSbYBvNz2hJ6/Jb6kT2m0k575z2YPDJhO8rDQPu426xAB75UN/
         Yb8YFYuNRIk5rteWLHivR+vtjG0LyO1X39h1pCBYiq0ur5Qn3iQA5bkOXB5Y9JLqMX1H
         6QJVs0x9koP0xGDx6Z4asiM4W+k31sbg1zW5+cQhIQ8uj56nHDNUrF+3KUHGEdUGas+0
         tIdEA4zgA6piTYTARMHrrgS2nyv87h5Ubi2BBcCmnQmG1j6NEvS1wqyEpodEhpn6Dk9s
         xnnApD2obqCljMq35TQwrcQGaGhBk8JOk+FE+hQ8yZDMPVlAgfeSNLuHG4K3JTd9Ii7U
         cNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412167; x=1795016967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/olX1ECWtvPiVGgVf9lD7wfSWXuiytEwuoy8qrBu+8=;
        b=kcI1HAafn8hFGBi1fUhDp0DdPEMoOUPFqAgidpaeLkTQ54x1BmBZqFGpp6ZX1zNrN6
         DLtyU8tOo7yb1ZlPymrTlhin+JnIroHJy3k4pPKffXccqTUPsI/kxVZ65SOFphfkKjeM
         uVeEr+jRUdu68VqOBgKUV1Ug4rUynqn8bjUOjqMTPGhFSge3GutjIBEMYnFseZ/DAXQ0
         jMqy6byWwly8OAMG5lT6YgI/zEzvl6CLeWE0MxWkZ/ie1/KXuzAqYK6bBaYZCIenHw2a
         1p2PFSzsjBp9JbkmMTKCl35HeBom892046yByrUZ7U1gkjKOUZCOMG9Fi3KXakpVi+Vg
         cRxg==
X-Forwarded-Encrypted: i=1; AL+hErERMofFb15nrGWXLBApBwNZ4pcgey0cYk4pCpt3Oqp3cSzjrFIz7shHnZy3DS2jvhkWQbaJ3V8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8vRpIoHBOZoDvTP80DojMuLwde8+DITKtO6Pay9K2jvn8VO721
	C8/+uIlbSWIv8x3wHiFDAMX59pd96qOm/7yIjk4aEeXM2oKpgi1FzLGVu6Ae8KuU1W0=
X-Gm-Gg: AYBFou3kK5fZ2v/3Zp5ImRX1qi5Gbb4lf/qwYUU+e/IECCiWKIe3US+x3jpIs0Me2q2
	OLqnKqfPe8GMVjtxkB32ULA5OPFyYPbW79DRbHeoJVqrENRWf6RrdViIzl0Ev7Gut6c9v/tugKv
	F9dKPvJiAH3VpoXwUr1Rn1bt0R7O81acLISuYLhg4CTRO8azUbS1wK6JNdjbUuEcPsRqX0PLzNo
	5RVL3nMzKEC1y1TNSJkCyM1LRUZayoCLF4zPGqN4DfNEEAuWRpKdzdIG/qpkrzSHr5Vjl/fQSot
	Oy0qDPH7Z8bOtiKfcrtuRvQncjXAnNQGa/45rU+7vebh/kkw3b3if3DJ1QMgx7eBo+Drk+/xdKp
	AnPelciayg1CUUTG6PUnTehpIA0WaqtQePHttW2ghcVDBRXEb2fbWl8+YdyV91c9TLC99hibsHM
	i4MCpf6OdZv7I3woqe3zt38ixKngMbJpKtWBM4XC7ItXS4wV+DmObN/5TSkEV8vPJHj5SciHRlw
	nVjs0oFaTh5Qr+w3KGWCKLqJyGEM3Qc2kgJMldqOReaZDAExlvR5nByhJtnMTgOZbNfNvLbCAnU
	8ovBhyIzcRyTQPl4ToQb5WysQ69zOFE=
X-Received: by 2002:a05:6000:25e2:b0:48e:68da:1c5c with SMTP id ffacd0b85a97d-499c764851dmr5225541f8f.16.1794412167157;
        Wed, 11 Nov 2026 07:49:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm6728921f8f.2.2026.11.11.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:26 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v7 05/17] printk: Do not accept an empty name or devname as a preferred console
Date: Wed, 11 Nov 2026 16:48:04 +0100
Message-ID: <20261111154816.71103-6-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

The current code for storing preferred consoles does not expect
the case when an empty string is passed via @name or @devname.

Empty console driver name does not make any sense. Avoid handling
such entries completely.

Suggested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 898e060a26a7..3ddbde5326d9 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2558,7 +2558,9 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  * The function adds or updates an entry in preferred_consoles[] array. Also
  * it updates some global variables which are used to make the right decisions
- * in register_console().
+ * in register_console(). Finally, it enforces some rules:
+ *
+ *   1. Do not accept empty @name or @devname.
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2576,6 +2578,11 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!name && !devname)
 		return -EINVAL;
 
+	if ((name && !name[0]) || (devname && !devname[0])) {
+		pr_err("Adding a preferred console with an empty name\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-- 
2.56.0

