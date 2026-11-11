Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412229;
	b=g6S825uhZQliu7htq0fq6VVAEE4Ym7IZm4uAigMXQK0wqZaiYp2w0r9Dpe/aXXYTWCGL
	 lKQiMvrF2y7IZMRVnPBk7rnv2o/yqQ+kn9rudq6vON1du2N2tVRIzO+L4iQs9h7OpogFQ
	 Sz4dGHVkVj8Sc655NIvlCTSz+Fg04PikGZk4spCohbg1D/Zw1x127GiWQGs+OJk7t0yM+
	 fB1rJgeJ0qsNlpV3VIPkaRihI7PvDnkQMHB84ZKlz5X+LrgqwDPZHuBNWVfr4FAKH9PiW
	 c92hEl3ear7yFZS/s75UyYKyH/JMAKc/IGszD9ycX386wY2Lst8YI3VOdR8rKddTEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l8rEbBk/frWGcm8vmmYWniZSKnyFmveilgeQC55Mq48=;
	b=WUnMH4HX6dyoymg35co4hPPuR+Aw72qSSZ1SzPQXHZXUz/Rv7qH3Pqlp2mrvRKoqlAYz
	 JZKpRMUsNeRax2ChuJMh/To764RnGHqcBgiBvidRUks2fcXRvtLZ/xRHOyvwej9/TsnZq
	 8J/5aS8iniVdye1FqGJ+pv9eXY/6ZiNjtW/fSnTmuF+b5/khGzPtVuYWVeMSFD0ujDF6f
	 mYDclkR+Y2EpDefnAeJrdgnoDIMZNYI3TnzeGaiQ8Z7QAlmZhDPJsje+oHTV8l2fo/Ccw
	 G4qfAhGqTgeBiMCWQGtc4R+04rbkGnoxQS7IZau1Wi3Wf+wbWxc4a4x4LEfRH/sxNBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L74TkG4R;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE0606A8A0
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AE0606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L74TkG4R
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so27127405e9.2
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412228; x=1795017028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l8rEbBk/frWGcm8vmmYWniZSKnyFmveilgeQC55Mq48=;
        b=L74TkG4RtZ5Cr6aL4Jlt8DlGBeTJz+x/7l7lb6dXx4uat/LPuU9JafPmzI1ympdztm
         eJJjpoWo8upK2/4L9cPsF6rFT8IQXYmE6/S5is7pgtccCIqZz+FW8Tor5x5Oab5iOWfO
         BnShPBNqvoh++0Aq+5gESlhIcOqTqdP+xucCwR2DN3f2Cu9mXlDlO+jDs5+U8eAJXfUF
         g6dw0EFGhV/Df3OUG90xsfJqMSnUVYNTKRHMr5DrTj1KGn5+bF+m+zQVn+2TRmvucNbc
         rRY0FphI50yLIt1AqWpw6SOop6f1zInkWYj5pRPzpQ2Oi8gSWSPrKdyRZrdasl3iHP5V
         TKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412228; x=1795017028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l8rEbBk/frWGcm8vmmYWniZSKnyFmveilgeQC55Mq48=;
        b=PK6tvrnq2NG3vA2zYLHNE/ThkGawk7s8cvWJ1MT7xRVsbLnHTvUgoSm7nAFJniyddh
         fqp3U+vQ5xndJX9qJKIARbiPPpQPLBjZa0u9Y/5rq/fuB1Ub2CHwyyiwfxlEBeBVnhB/
         v3uOkqR5kRIay6fB7tzCTnmaf/SetEAe6XxejqYdLR4xBtwR8/barktcDE3+Ncw2656Q
         szFxJWF51NJncb+NBsLjyjn7/9W/2a5xCG1WGRq1I2whj048CL+Ybrd1qbmRo/Huiy7d
         cmJS19FOWktY+bBKZQU9f9YxGU0dLqQtTIaAtO61otqKBForFUUUnB/8+7YPF1Lm1Z6M
         ffPg==
X-Forwarded-Encrypted: i=1; AL+hErE4y2flYYN4ImMRWGuplw7qzsCo9ODWkE6IUmP1SGUTaiJID6mH+kOTAvbwzpwU1wvnbTiL6ko=@lists.linux.dev
X-Gm-Message-State: APuU4Z883eBjEJr8sPfBTNaWQiRU95YciFTiPZjfOiM92hO1XHLZJjLH
	0astJQ/lA7mav4rKdKAtdE40UyjEbBj9uxPibK6VY3PkO1DoNDenstn75QRtj7WvyN0=
X-Gm-Gg: AYBFou0ODHpmjXaaJm6wCNDRMaou3blZeIOJT8h/olMnsLyiDc1D9S/Iq5rHaVadNVq
	0TNf4cGQGudjc6DiLphqxyFJKWdVFoJClqTiP4XBeOxdFODxCtWmyNCJLUJizhIZwYrCU52AArt
	g0xkzbxfsCxuZy7T4GV9MALSnV6X9pSGOASflLaRdyfDYhhLTJbIQSBVAvLBwhOooFYLAK6qZGP
	ORUsYO2YWMgKiTekklx7eyxcW0tz8YRinUtv9Ztxf0Q+lYjMxN7ZyNPSS8O6X6ug7foBh1a8cLd
	zvnHyF8+gA3/zKEQe6Xr0A3OPs7JqqHBrBhvzdGK0BTEgsOPnzLxxekR7AsfkTThCLSgUS+iRxG
	4gxnFokNfSca9LdWhPLzG+gqXp+iig2QhwPPuqL7Bbc4/JIgUnHqm+o4fHA3ISttVmpy+hXcuVw
	HkLLzlV30FF3IKTY0Ljrs5awbx/LBsrleqR9qv4btC4jnwaxS79xXtDfSJFoduZhb7EiHd+ksku
	cJICCUa/PSnoPhvLBrY0H/XYJXZ+7TYHr9iF8FGqGGFIehXkSPJPQUqXkUgHpG5eWxxv5wy9igg
	jict1SXmdTd2CwB4nx7USIjKbZIzt2k=
X-Received: by 2002:a05:600c:1d1d:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ba09365d6fmr50914325e9.18.1794412227371;
        Wed, 11 Nov 2026 07:50:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5c320dsm4460995e9.4.2026.11.11.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:27 -0800 (PST)
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
Subject: [PATCH v7 10/17] printk: Allow to debug misuse of add_or_update_preferred_console()
Date: Wed, 11 Nov 2026 16:48:09 +0100
Message-ID: <20261111154816.71103-11-pmladek@suse.com>
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

__add_preferred_console() should always be called only when either @name
or @devname is defined. Allow to debug the case when they are misused.

Use WARN_ON() because it is rather an implementation problem, it should
never happen. Also the consoles are typically added during boot so this
should not panic a running system even when panic_on_warn is enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5275bcf32578..60ae813769b4 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2585,7 +2585,7 @@ static int add_or_update_preferred_console(unsigned int i,
 
 	pc = &preferred_consoles[i];
 
-	if (!name && !devname)
+	if (WARN_ON(!name && !devname))
 		return -EINVAL;
 
 	if ((name && !name[0]) || (devname && !devname[0])) {
-- 
2.56.0

