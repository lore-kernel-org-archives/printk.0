Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412310;
	b=kXmBP0icl0hLGQ9xyUV+zjoyal//8uHKxfYJc4HwboFqmVjxbzy1NtKGJy2zBYgC1Tom
	 5/CeYuvEFTcB8ltcvvVNsJC+ajW4prJ4AuChYEpZq/w1DW6ViWqr0d6voZxPlnNDG5/PJ
	 PGaParjtcWy+2jOrwvnGl6DAcrhtenj3WbhVJv49YWulteM3NbyNBSPtdtJjj7jBfrap/
	 j0jzOT33QnNA5rkTP5xL7khDlDjfpnocU/J8XQ9oVLNn1V+bOLLDLse1a3BsDhpq5glfA
	 5RRKMA+CRI7+B2lOyg8x3MHcJjoGssgx3BH2+7gvTYtbn88aFCOKkPkWToXe3EGwVDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WK6lzA6BtQAoPjsYzKB0b1XZHfDTPG+t25fWV+Iu+pQ=;
	b=HJjCJ3hsJA/+78WFwCxQ8X15FSbvdN+lH1iY82j0rtsjjh1ga4185ciZ6p7gVwBO3qZV
	 DgcMBBx2VuDQnhsQErsDg9b9T+UAYD77H5Va0w/iRUCM4qrzfQ42tqQalQFx674kcKdDv
	 g19u4QM8oBvYkIjFrFZZ63PJU7cJt3aBdpf8Q/Vuy7zJYnMx7miZFPtBtwZ/veGr56wQH
	 63u5wx21gm4vsIiI4g/6Gy0Qi27cS16gRNdWzkxDwMEUxzlELmqLQKD3lDEN15nuqgqVM
	 RCgQr2AfC3vIz4s/G/gKc+d3jdmHZoOVGZMc7+G5ylpxgVvov/trqliJN8OtiBqqskA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XwSAmbNY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CAF606A338
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CAF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XwSAmbNY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30567015e9.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412309; x=1795017109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WK6lzA6BtQAoPjsYzKB0b1XZHfDTPG+t25fWV+Iu+pQ=;
        b=XwSAmbNYW86Eh6P1zNBXBNEzFBnQyTg3fFqh5eiLq95vboJoBEuT3L2Ww8WVqWbrVc
         i0TY0PdD8uIx0xSbXRxRYmQCRhBtx3RhEoRs3oiInFVNXtmG+B86rkTkp3Va9sG9sW6e
         QqCpSX2I7CFxZnk4AjQs6FBZpLkEDeVOe+K/Ry0zhk6qwtYuhDKeOULFv7V9+je4R2zK
         /mgg5OrweWR9XMoHO/Yn5ffmcGj/p/UkD7V5exlJ1th8DX/TQmatludt0oqcO6Wy6CKP
         3x22F/KRjIU9LVNKj/Y99lq2Gp8w0FF+HZ35UYhszizI7xFpnBpGbc1B259xIyoVFiZq
         +EZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412309; x=1795017109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WK6lzA6BtQAoPjsYzKB0b1XZHfDTPG+t25fWV+Iu+pQ=;
        b=GSzaGNGXMkO/qiqoDUGZuwxWpmyShEY2JNLeYC7YQYoH7sgSZ0VhHOO0WLLK0tnMxM
         +zD2vYrKYVJSgVUqX9NYVmO7CzMfJZHe5nZHplr3SMWLZJT5GUYQ9022n5EKTJKClsyE
         9dSSBzGGMZVEe5WLSxfwzfZMb9wWF32C832EcpaszQ1+PGa9fXkLTJXsrLFCn0ERMJB4
         J2AptwSmdQcj9wI1pIPm1IkmxRgvweKMN4tF2wH+J55e9MqtTRwP8PAFiBMHtZAZ3Clg
         f1oL/JpiUJDLgmJQSplsdwlWKWAbxGCnQZ07J5dQEPc1DLEOCwX14lewQSsy0qWI/QwF
         lgyQ==
X-Forwarded-Encrypted: i=1; AL+hErHLSXmF2KIVUu7rJE4l2Th3/tt42F9ngZXmg5pqcAniFeHRzHvWhnC8qPcv7HFsirfVHfSk+YA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/rz3FcI88VwOKs4rXK+MyL2VVyLVNGyxE1tNBSkmJuPRo7/Ug/
	/fnOYZ6iUiAiKEj/yJxmmAVtBeAU4CiIvKAuhXJDGuxFyBrDqASEdI9AjflMpl4Hjm8=
X-Gm-Gg: AYBFou06PhCX1JFXDKIWmNIu/y5LQOcgSfeorHtO+L+M27DzXtyqqjBGWfQD30etvdd
	++T3Q0q3xupb3DYox7CMir9s2IFcX5496Jkq8/Tx6jHvnL1ktuFFd5bUe+VMY0zwZICVFXGFHR5
	2PBlJYWdi57of4Uj309q5G/WL3juHCXl5CJ6R1ak9AbgQCVlaeqDY6CsysF+gVR3e3QWvMo9MXS
	b9VjyJzUHa4uSZIB2I6vTej1uP6Zzq4U1kVUvLZ1s8az2sKwyNOiIsTfocq3jLuDuTmqkNLLp8Y
	0h/3c3kirL7IorNwJI5RUyV74PzgrJWeyDlPmwkPCSclskSIiMgpedcu+2dBiw5oSUJGCwcRdWu
	x/QLMqKytjQ27vh6CoGmNGQj2WDVCggrvBI3se7pE2VosTf74hYVx3/MCt3Wl25Z27c2JZD2BaY
	tlJdxxpDW3lDPDkJbRA+z1y4w+5yt3z47bYhaNpgS26ly6K9g8k2Ntt24KmW5SorYpIaEhK9Tb+
	bKodFQZ2zmhH56EgB8hkIFomy61MuKDuvakMkaYgSHkXmPcsNiHNgnI6WrA/IhVUHb32j6AdhuK
	p7eiFg1uUQT9WhipUnN3GAd7869/rtZb
X-Received: by 2002:a05:600c:4f4a:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ba0938a45bmr62021835e9.14.1794412308798;
        Wed, 11 Nov 2026 07:51:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5553casm5187795e9.14.2026.11.11.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:48 -0800 (PST)
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
Subject: [PATCH v7 17/17] printk: Try enable preferred consoles only when there are any
Date: Wed, 11 Nov 2026 16:48:16 +0100
Message-ID: <20261111154816.71103-18-pmladek@suse.com>
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

try_enable_preferred_console() used to be always called because it
had several hidden effects, namely:

- returned success when a console was pre-enabled using CON_ENABLED
  flag.

- enabled Braille consoles which were ignored by "preferred_dev_console"
  because they were not associated with /dev/console.

- returned success when a console was enabled by default because
  try_enable_default_console() did not return success.

The first two hidden effects were removed in previous patches. The already
fixed handling of pre-enabled consoles actually helps even the 3rd case.
try_enable_default_console() sets CON_ENABLED flag on success and
is later handled as pre-enabled.

Prevent any future hidden effects and call try_enable_preferred_console()
only when some console is preferred.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a261749aac79..f64381e44977 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4105,7 +4105,7 @@ static int try_enable_default_console(struct console *newcon)
 
 static int try_enable_console(struct console *newcon)
 {
-	int err;
+	int err = -ENOENT;
 
 	/*
 	 * First, try to enable the console driver as a Braille console.
@@ -4144,16 +4144,24 @@ static int try_enable_console(struct console *newcon)
 			if (err != -ENOENT)
 				return err;
 		}
+	} else {
+		/* See if this console matches one we selected on the command line */
+		err = try_enable_preferred_console(newcon, true);
+		if (err != -ENOENT)
+			return err;
+
+		/* If not, try to match against the platform default(s) */
+		err = try_enable_preferred_console(newcon, false);
+		if (err != -ENOENT)
+			return err;
 	}
 
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-	if (err != -ENOENT)
-		return err;
-
-	/* If not, try to match against the platform default(s) */
-	err = try_enable_preferred_console(newcon, false);
-	if (err != -ENOENT)
+	/*
+	 * Make sure that pre-enabled consoles won't get registered when
+	 * something went wrong. This is just a paranoid check that all
+	 * branches above returned on error.
+	 */
+	if (WARN_ON(err != -ENOENT))
 		return err;
 
 	/*
-- 
2.56.0

