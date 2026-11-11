Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412218;
	b=HdabytT9SuIRzxzpyUwUB3ObfYZGzdbAxmp0D3UHZsIefSSzdxXMPFZj2/dSwvqj7wUX
	 iX6zOFKz8b3ekVez3Zy32k6ZyAxt+djEIV9vzcWyHJnWnpC7nasr3JPszYNm59i2Le6cT
	 ceiUy27EaIAJG+3HHTsGPoH9DgbW9nB84eEtq7a1qgNJfokkLQB/p7RIwxKN3AmzIJeM6
	 zd3IZ4wt9A0mrtTxXUyW3U5yOakiJPYWPYPg6f1RJZDQly0zyGWfx/xzSfCiRxDxztJFa
	 mC+Ky8ZYKrTU6xAB0LqssOUYtFrWIM0l1Iva7/Ug20KKfGoa5a1iwCYk0cKiZUmKPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OmhqdGtVntrssGlTkjK6VX+9KY8nrwvikDTwqEXEgkc=;
	b=L2QTyRlqt3bE/XeKkgR6A1kKmsukYfgQy2+b/KUbw8lhmNUJXZlF2524/hKsToEnf6aG
	 He4sNSSlOI5UhDhYZfXtBaD7czorhM0p2e7ESewNoOQLHPm6PMdWdtGRLfRPbRZuWEsda
	 ylDSp+j4DbbDukGXjv/UkvcG0qjnLudhsnZjsvecMq22cYKZKKhxjqfQ6SWE9Z/xMThEZ
	 W6Xwg1tZXnzawzIIIQ2PxRGGe7NldYmE5AreWADMOEdK+MDv13E/Wc23UxY8bZ8XyJSl5
	 oy92hREwUQqH16n1/C9hUuWdFQybA2qHuyZdS4mhmhWFCXKLfP+xqdXiE9dEYMKnpmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TMb334r5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C287606A32A
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C287606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TMb334r5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so30741295e9.1
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412216; x=1795017016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmhqdGtVntrssGlTkjK6VX+9KY8nrwvikDTwqEXEgkc=;
        b=TMb334r5UnGtw6LupKYZg2QKHOTEk1D8lHxr9lcdbffAqgBtfpCdXR2gOCHotKNlhr
         flmzsHAXp+XKBd9FzAHLZx78NeUUZudDMQWECLIrPIiON2MrTCJqr9CzxdKkc2y9osMX
         7GZPj8gBnJhiUeUyr9tCjqkXzfi2eeGrw4by/pOEWfxVwrviy8V/3HACNPD+2Rhm5cvU
         MBE37E+Iwd0bWRQWcVcCUdWX0il9jH0srIUfDVxZrms8mZGQl+IhQezGilDv0HOa1x0m
         3tQqFereaL+MHFoPhUwpOx9qmPl2bn+66Uh0l0+3Lx4cCOs9s3Ws7S35/4ocIN6X9bpH
         9mWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412216; x=1795017016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmhqdGtVntrssGlTkjK6VX+9KY8nrwvikDTwqEXEgkc=;
        b=GJXwzMwW0c/9YJQNuDmIs220LmWKB7q0jnbEYZ0lu5Z4Cb+31fc629noY8P+0V7EMX
         A/3GabYg3GqQrKRtV4gjbUp+Oh5uey/FQrGmQftL3Q4/cZzgXoXGxbKek4+88Q+TDfFg
         qAZUQ2/Bpa84e7DxbCNyYct3rnekj4tg/AkN1ZuGDQ92PsITlnYMshxSTEHHhGeb6knL
         alM683CBVgVxI+CZUGnNO4kwhl0rfATO71d60UFdrgZPQYER/Nw+V3YZUToZ8BK9XBOK
         Cxdh3Tzs5moKD56kRQbPnD0jJQB0cn+Q50keWt0osMvQLePcyVW23oqgSgJPxVCgleW5
         T05A==
X-Forwarded-Encrypted: i=1; AL+hErH3Ro2ApnmY/tj1F2knovdv9UH5uWOitn7OP8TMRyK7RjUzpb/7Ge9sWwcjDSzZWkqNfQ9FTy8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8q1Rg8DsszVUducFLLB6nFgeZXnXS0pQrPaKKbeKmUq67BqND/
	+zJn8DiGTGgPrsmRTsb9uuNzbCe2++ODud9MmOifqdknH6vTttt59C/Q5wu8GHK5TJM=
X-Gm-Gg: AYBFou1ESnY7JF6PKCPPaOdFoe9aEr3rwOisQCGChj/d4AwWXyTeWwEZY+zYjkCgwpR
	8xXIWnixC46TNH7kwnnb9oi/2pOIt3MAf8J6PjvZWmWP8Hg02GEmwX9qjZHkB/NOyb8cRU0Yk+h
	a70Ys7/rSYnQZrspCgpVAvuGpFmIX4rTPVWfCEsuIGyyPk9m2wSh3mjDvZ2ugue+07/A+R0vDJJ
	/avkKHGNgmxgbDM5NMwggmRpLlJRoAygwirrT7YYq1GCAshwOeSqlOS+BXwT7mGlJeCcDDov/HV
	HMuEwir+O9aptXl1+f5pE8WPgXb43gU03hzsNGDZBTOCjb1Xi0KHp+TqDq2KtnAtmubrYWNXhUj
	3fanqCNDdFmYkGCm6EuFe+ucFdqZe9M2QfKtL12/hbFOLtHYF9hFJNF4Y/YBpHQ28iVBs3MFDfy
	bhZ7tccfgDLRrDAThlrOmrGO91xQmPv8UX6dAWoYiVtgySxeTCHdxYDrvOfd51/Py52ftFy2gsT
	0hkxmwRSHgl7XO3tTTCMwqg/QhT/Pu7BFSX/TekTmWoWZnofpGF3J4MyWQycFa5iGMQnxaGQdcT
	G7M6y1ROTWTokykqiXN1zeeSxsKsj/k=
X-Received: by 2002:a05:600c:b86:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ba093583e2mr54869735e9.6.1794412215332;
        Wed, 11 Nov 2026 07:50:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbfcesm34455965e9.0.2026.11.11.07.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:14 -0800 (PST)
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
Subject: [PATCH v7 09/17] printk: Do not quietly ignore adding entry for a preferred console when there is no space
Date: Wed, 11 Nov 2026 16:48:08 +0100
Message-ID: <20261111154816.71103-10-pmladek@suse.com>
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

It is hard to imagine that anyone would want to add more than 8 preferred
consoles. But never say never. And do not ignore new entries quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e9b189eae548..5275bcf32578 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2578,8 +2578,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	struct preferred_console *pc;
 	bool is_new_entry = false;
 
-	if (i >= MAX_PREFERRED_CONSOLES)
+	if (i >= MAX_PREFERRED_CONSOLES) {
+		pr_err_once("Reached maximal number of preferred consoles.\n");
 		return -E2BIG;
+	}
 
 	pc = &preferred_consoles[i];
 
-- 
2.56.0

