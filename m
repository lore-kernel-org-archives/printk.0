Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412275;
	b=zyi2ggU/vfPA9tu65VGMNGzIw3nCX9eP0ytRAlhztVqEqLUsmHM21MiSg9COk8Ai8LLL
	 ihh+ZS27Am9Y1OZGyJPBCyqIGk2UFaTbDyLDc7RneLvNcAKwWHrvVUz76Zfn8RA+xqz6l
	 T8KQn8g8NWzH/OKvK3DZrvxYv2uIa7pOpxFcRCXmvJEbqn2lt7uEhFJCguxHf6KzIU8S0
	 jX4Jfsf015zIwACQHN7ZOqEPeoZ35VtXk2g6IC4ftqrudNIs9FjTDubW8Hq6qAQ9+XODE
	 lDxvFuda5ukeFU+Pjh2yUHfSuyqZLGhm3ACw0L6oEc4Ck9/qAdmjNk/0pa+qgIHejuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRqXfmPntNeFV+vfVsKHl6lm7LjVxrhMPi2D6aVtzSE=;
	b=qevoy9Xe0oCSDPYe82WkPB/ZAMGJ4WBA3GntI7u8t4BwjpUM3SsMFhE2nYv5Wn5UqxKq
	 ceADS304gqVxrXCS/iTuSey8jXBrKMDflrlSQ0+IhPsHeckmGUss+TORh+56CVICVbz4a
	 33f/jpob5N1YmKjCzuzW5LQ9MMjgM0rvoZHFhvWEBG5fOZQNpGRqylGLhjXqAOBGTlSTB
	 y+Mfx2OqEveCqaTmq+G5kU7LlV9QpjkizrGV1MRs5CXQoUyxxNS5hVoq1BA7+NzWeo1hc
	 T9rq0HqJSfv1f3jiNheuAlxLsvHlxetcQ0vnSSB74W1GJj5xnIgAbgZf9riXJXLXNfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D7BV9dz2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1E606A890
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D1E606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D7BV9dz2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23242415e9.2
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412274; x=1795017074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRqXfmPntNeFV+vfVsKHl6lm7LjVxrhMPi2D6aVtzSE=;
        b=D7BV9dz2RGfiGAV52s78EamUqLXU1cN9b++5eTuFtSecBlpBe5kPKXOoxzGR/9yXEZ
         4z1YziC5qI+A90H4ChN2MTG42KQKEE6HGJySfcpBuSYo+10iZKuWAhqXL9zlWGZpn0T4
         DyRpjnHJZcIPy3FW0DwmUO60tESuU7I/tbj4JJcQReTu5e5SrEf9yEWfgpexL1RIHSTI
         zfm3PLoJl7+wHOG+fD5eLQNFyixkyyjp44RofuC3pEIWqjGHV5c5CK/cjNW+mUk6rqzF
         P4fyMrCfijRW65mVEeGX3Qt78XgVGY26I8wy/VebT7ZSvG649T96m1nMP5nIWz0Rp9g1
         uXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412274; x=1795017074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRqXfmPntNeFV+vfVsKHl6lm7LjVxrhMPi2D6aVtzSE=;
        b=uE2WuHbYEy4Xj9VAHbolztHdQw9Pb6hIRAZ3dyClXOhWUXFJNurRV7vQcxZ+oGvZbY
         deFJCLiNCRbxZHvfiirjuYh4JlEgjjTOVtzdPY8mL6a+qqN0nC/ZrOQYxRiHbFBwgRdN
         jTAHQSMLIXW3bOr5kEyEF+N6p8sv9dxODW8K2+a58rTIF9z5mLZnfVMojgjR0pDi9g6L
         JiDtW6WgUQB6OoosEo7sYBAuxLujsLTjSShdMzdC5FDIeulhftqb5X1tHvIQJvqpgwgl
         9yZO0QvAa0+KA8alDkD/pd3XBLyIOidFTM6mgqHc0+YWranmbo/QYIhdd+wN/w3iSKGR
         P1Sg==
X-Forwarded-Encrypted: i=1; AL+hErG7E6FVuQxCqsFIj7Ztb5sbLLKBNOCI+o8TCW14L5CP0qEhhD376UzIb58TWIdH4gPa5wOdiF4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9fcTOe3FHaGJSldxFcfAiDOZGfgB9WlJLIOjUZGqnEsiAOFJ4d
	KcZuQCdGUb/oTAQaksIibZmbRG1Y9n/aO0NYyWfwDN2K4lAk9/8M3gLzd98I0v3voRcdIw9cFpQ
	qQUp6VFY=
X-Gm-Gg: AYBFou0EtPgiKlzzqFkUuOh77kzFgOmBcZAPjMebBitU7y8CQkus+dlsUPqZHD+5jPs
	ASeX/cxG2exfHTQ/myyWxBzoJJpBDauO6yifYg1/gH5aLheohn/uYVcX/q2sqd2hOLRPKGvx0NI
	P0PIHRhftWqH2S5fFUyn5jXpRF4KTbqqIR21+7Hiz+ou50pUGq2zohgfOW1WgyU1Shzyv3eG8cj
	UEzI0e4QMdzSPXzVaokUqPIMTrH8zvW9xqMmjIAAr2DBzfC5R4K59I10UTE+BDkaOAEkLErgXqC
	AzPGv/LE/VhWF2hldFOmF11aXhlQBb1Bs3uupu4051fdXbmQdOSGZvk/5OpPimtA6+uZOgIUVfO
	b2Nh98alb0zw5Zh+uhm78HKu1loQKS4p+liHCq6ukTZrr+CGmucOMqZFrXYkX4xr+63cyZZVzAz
	mmQltnYZru54gYwgfwFL50Ty14qoByQN6Es503ZtiCGAPiPXQkV6lXE6marZ/NIf2GCdAn69S0/
	ymmCKZZchTNH56rk2Sz0XYp0169uD7RPfmBGUSZJjowx1a7z7QlzBHSfx9sOrtQm3/VKTEfTa2s
	HdrElps6QQWShI63XZb9U4zK+0Qvnws=
X-Received: by 2002:a05:600c:190a:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0931ed17mr51546915e9.2.1794412273819;
        Wed, 11 Nov 2026 07:51:13 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f54basm4010705e9.14.2026.11.11.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:13 -0800 (PST)
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
Subject: [PATCH v7 14/17] printk: Update Braille options when preferred more times
Date: Wed, 11 Nov 2026 16:48:13 +0100
Message-ID: <20261111154816.71103-15-pmladek@suse.com>
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

The current behavior is not consistent when the same console driver
is preferred several times as Braille or non-Braille console.

In particular, preferred_dev_console is not updated when @brl_options
are passed. But @brl_options are stored only it is a new entry in
preferred_consoles[].

It is even more hairy because preferred_console[] entry is considered
a Braille entry only when .brl->options are defined.

Make the behavior consistent and always update pc->brl_options when
@brl_options are passed and they were not defined yet.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/braille.h |  7 ++++---
 kernel/printk/printk.c  | 12 +++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index e9790c28027d..7a845caf4082 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -5,9 +5,10 @@
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 
 static inline void
-braille_set_options(struct preferred_console *pc, char *brl_options)
+braille_update_options(struct preferred_console *pc, char *brl_options)
 {
-	pc->brl_options = brl_options;
+	if (!pc->brl_options || !pc->brl_options[0])
+		pc->brl_options = brl_options;
 }
 
 static inline bool
@@ -35,7 +36,7 @@ _braille_unregister_console(struct console *console);
 #else
 
 static inline void
-braille_set_options(struct preferred_console *pc, char *brl_options)
+braille_update_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 617414d419b1..d1481ae6c729 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2647,10 +2647,16 @@ static int add_or_update_preferred_console(unsigned int i,
 	 * Historically, the preferred options are stored only by the first
 	 * caller who prefers the particular console.
 	 */
-	if (is_new_entry) {
+	if (is_new_entry)
 		pc->options = options;
-		braille_set_options(pc, brl_options);
-	}
+
+	/*
+	 * Allow to override normal console with the Braille variant,
+	 * for example when ttyS0 is preferred via SPCR brl,ttyS0
+	 * via the command line.
+	 */
+	if (brl_options)
+		braille_update_options(pc, brl_options);
 
 	if (brl_options)
 		want_braille_console = true;
-- 
2.56.0

