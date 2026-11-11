Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412299;
	b=uKs6RBEOl5e/HrMfFzxSDSQzA6amJycoVG0vyawqJFVVxcp/p0jXGN+FSI6g+bVseeLJ
	 ix95/s9ASMxZTvxlxGYNsjh2lErd56Ba1U5+pU7M6b9A+wMfAP9CQKg3Um2yyYUWrBdlY
	 K3UIcaraTU3c+148yAQk3rth8itKJBWmDuc34B+k/TsZi+AaDPWut27pqsSWZWmEpdnrL
	 R8gajBozdb2VRC7uf7IEb8DcaucNwwiJQNdCj1EN+MwgU2WLVeSaW0hkEzI9AYnuyo6EJ
	 WVEaHWgUSqlytA/2jk9OQuN70OH2wkg/xfZLSERORhMIoaO6SqW2v9kFUfk9yVi6o7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUUn2/0tnoLN6C+OL+LWLMgnH08f0bPQiH+/0TV3lF4=;
	b=w8KD/dDag2XaYgLJxqwCnbhYtq1kW57jZOJ0nvX3CLy+Xh6VgHgtlNJhCU1SsSPMqU4r
	 oowEzDFCxrYMkeANnfD2DxbdotmDk4LySleFZKC8n/OgvmBziVd3Vl171qAZ7ltxr1/Zv
	 oX4UbCVhF++V7EzX3BdoCOdECJoPuJDgSNoOBCIfU/JRV3vaUjEGiOThp2hcTXdiQT3K2
	 QvtZ1p9XlX2mAS1L39RoDG4/SXkQPu/Wpy96YYFbeusjgdjOw4bavsCHKiqM13GZFds7a
	 36gdysOaeK+O390Dm6tY5D/4Y1mCF7kk2/NUfvFLuFsXDYh/kPFPc9WhZUUssj8do4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKTa52KH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279E606A881
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5279E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKTa52KH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so34870025e9.2
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412297; x=1795017097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUUn2/0tnoLN6C+OL+LWLMgnH08f0bPQiH+/0TV3lF4=;
        b=HKTa52KH9yst7+kjtvZbMpZr1zT+A6EenLcPexIhoM1Ni+lvwS/3PzYLdncmBsPPph
         XmeoOoULvc53Ac5lDvVDcXZFB7bWRt5iq9eFzOQtit28KiIcuaCbfGNFdhf9P5X/m1Ul
         R2ehEx+fVgKXbSs8kdSSuCDKccrkub8AzT7dRYD/PMHEZ5pDeJGqKnBbBoHkPO6SOTV6
         CVcU9uF7Ti+ldrSvQWt35iCUPbs5jkL5JO2RtdRkbJKrP/NN9hLoeZaw64T/DbGjwjVB
         FOzP58DAWxoUs5TmpPuZ2Xm/uC35xiO3aIYDHI9IL60+KDCbrqh99w1LAOcPCWsLNZLW
         yeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412297; x=1795017097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUUn2/0tnoLN6C+OL+LWLMgnH08f0bPQiH+/0TV3lF4=;
        b=t8tadUcXSTUjZ9U8MZ0qvjCHWg5p0uDmekh4jSz2WTt0ZudCWVqKeIYuPVpQSRP9zG
         tXaL1yz6rZnLqal0Fkev1JdAFn9NdHO58G2YXl5TsdRXXtqjpzIJjPcSXk7rY5XO6Irq
         kujDwJ37jqrHytCZGAwlMhDK/e7r0vYi4kQkZNKIdor5PXEmcpu3OhZyiOX9W/30Hndb
         7l1MII6iM9PvNtWcIK1Y7PzF3jJI6Jzl57AxIBx+ZvGkJj+ZowbhS1PLHIFEldZQesTk
         wtM4HGEELTjpz4xBFmRyF2+5iTGPg3XBoSKMMhOQV4Yhm0GiWRKL2mVZM5dSKb0h4pGt
         jN1A==
X-Forwarded-Encrypted: i=1; AL+hErEiizWpZn/pCZJbEeH3epLWG+hCVkmo/N0mFlLq1VIqZ1cvoinf6cucAQVD4+ycfyAxmRRAT60=@lists.linux.dev
X-Gm-Message-State: APuU4Z/M7LmaOlyvWrDmqb/ZHQ0G/hYfgoiJSjg0TDTbg5rSPhRcceqN
	mBQj7e0pyHQbxXMJfxBzOIKWekeQ3tYgT0jsjUIXIjcmoOTRs5GM/4gKWRFgAXS1MhU=
X-Gm-Gg: AYBFou0Ei0bfE0kXDlUc+AWc6WQhSFWtoj31XcygF+tmM1ucT2Y5Yqa9Ybo09lojt1n
	YCaNGQajh6xnn2Dsdc1QO2cqveeOZKGmnYE3SYacRpsXvpMDCwkeUgnHrcKZCSSYnXARmuKuunu
	YK5R8eBWMOa6n9oFKgIiFYnBAV98gw8qICGqrlY5P/+YloqrR6iSclYFZCx4UQ6FEyJW9LcisCU
	G1fJcJ9wPFbz2xZ5TGwWGzex6GSa9ODOryxyl74Bpo1vbvfN63DMof0bslHibxSTueV5gXRXY1C
	n6Ww+jx7YoI1fF6kxjv6wb/nPLTH0YDerizr7+mT84UVcKuS4MDwduceW7Vh5nFjXFF4Uxbczrm
	PME2UvOF7mMdzGUuj8Zb87ddHNFm1M8F47tG3BP8aRJtKDO9gTA8sgwJTYIa0oVI0brdMFY/23z
	z1bLw5CCbfd6VChFeLI6egpbiEivVMYPVIPIdjkpFzqvMXS5AA9QtY0u/EkUMr/DkmGP0NAxu5+
	LwKw5O9NmQIDp6yy3bvrA5pTxMY1LjF8mmeCL5To+rXxeLwCc7odqDdnS2B1NKeJCl23pTlAVF+
	MCwezcJ4xYgsBdtD7pwcdpr0ZgVONgU=
X-Received: by 2002:a05:600c:6095:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ba09381439mr54276165e9.15.1794412296743;
        Wed, 11 Nov 2026 07:51:36 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm10312105f8f.20.2026.11.11.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:36 -0800 (PST)
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
Subject: [PATCH v7 16/17] printk: Modify try_enable_default_console() to return error/success
Date: Wed, 11 Nov 2026 16:48:15 +0100
Message-ID: <20261111154816.71103-17-pmladek@suse.com>
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

Currently, try_enable_default_console() has a void return type, and
its potential failures (specifically when console_call_setup() fails)
are ignored by its caller, try_enable_console().

Modify try_enable_default_console() to return error/success, and update
try_enable_console() to capture and propagate this error.

With this change, try_enable_console() will no longer return success
for a pre-enabled console if try_enable_default_console() failed (such
as when newcon->setup() fails). While this might change existing behavior,
it is the correct approach to ensure setup errors are not silently ignored
or treated as successful registrations simply because the console was
marked pre-enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60a6b407155e..a261749aac79 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4081,18 +4081,23 @@ static int try_enable_braille_console(struct console *newcon)
 }
 
 /* Try to enable the console unconditionally */
-static void try_enable_default_console(struct console *newcon)
+static int try_enable_default_console(struct console *newcon)
 {
+	int err;
+
 	if (newcon->index < 0)
 		newcon->index = 0;
 
-	if (console_call_setup(newcon, NULL) != 0)
-		return;
+	err = console_call_setup(newcon, NULL);
+	if (err)
+		return err;
 
 	newcon->flags |= CON_ENABLED;
 
 	if (newcon->device)
 		newcon->flags |= CON_CONSDEV;
+
+	return 0;
 }
 
 #define console_first()				\
@@ -4135,7 +4140,9 @@ static int try_enable_console(struct console *newcon)
 	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
+			err = try_enable_default_console(newcon);
+			if (err != -ENOENT)
+				return err;
 		}
 	}
 
-- 
2.56.0

