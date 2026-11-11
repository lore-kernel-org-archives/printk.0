Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412252;
	b=ZzxSuRBMy5wktBoAfd/T54XpghJ5DHDrUIM4311lhxQkh1CjM4irMvnRTbfWODO1UZzQ
	 zyePBUIHuUfFiteAzMKM0WpMCdgQsCjqJ084dRrE8vwLrUZwFqqXeWCuY/cCF8GGbG70d
	 wHbE58b9qgYDJLK56C6kpUpH6jZpOgfmudEdi9giQZSrmhzS22M81mZMeXsvn8I1ZlTaT
	 ZOx3qrxAgVwjJgPxkYbwTV+ih+ClhV/Q6SNNZgKG2sHe+WGFYJ9OasgAtksMmLGaYFfZS
	 9lf0rE4jaBKQi+ZCPrzESkQVqauqe3ssAx25EXBShWrrA8Ve6igx6RTzEs9cybLv2XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k6G6xgqSlEM3Q4tZbFCHAlRdnKn4XyO0f5C8BowqYDo=;
	b=YvXlEH77W/bidDDIBF9sHqRjHWuGUAhV95Kb7Yw5/sTnYmkAmu6Zmn9M1Vs6X3IojIOT
	 vMjrKN7lWkeZcAIm6SaXYC6h8NthQh52RgNeOKyFLILV/kWOg0hrl9yJMNsqq/nmVEP4c
	 hTD0oMFIaRljxc6AW+aO+QxV1n3DK5kkyhTN4Fs6KDDz5IU9Z0ujiJlPLsskumfMpp5fk
	 Fgp67ZW98vWKygcsLHthz5OYGIBrm6Doh9WKsZhfqKD5Ej5aSpwQ+mh5iyQ+SFWf+0Kbd
	 QYRabSFJMKg90mar0wnl7N7j+Xy7KOHRD1bpEf+bPWrIXBMAx6BdjZRYe0PhV64TnGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="dd/AP5zd";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566F5606A32A
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dd/AP5zd
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49134c8509fso2725394f8f.1
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412251; x=1795017051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6G6xgqSlEM3Q4tZbFCHAlRdnKn4XyO0f5C8BowqYDo=;
        b=dd/AP5zdbUwLSuq5pWo3cMm87Ev30ii7HAZBHklYGyv20FDiQF1T7X7y0LmmhLT3FR
         IPA+KtG5do5uahCCanL4XGRT2c393vNliqg+05p/H+zj9XJzxDKdHoEQeU/00kK/ZQQx
         2GCuhXfV/eJxsGXdqMFqmAppEPij4GmH7+PHOebLO0kCmUHYJY9jtAhaKA6cpKMeX03s
         +eNpvFR2i6tAHb4wZJztdU7a1co3r39L3kP9bTib5Swh7kiZ2FAYRoeeqb3L4aNKiZJE
         mCO63PSVM+Eax9znciFX+q/mobRysx3yxAkIwQ2Es8nmX3bNo/YwH5QEuTi8+Nb5kmzB
         qlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412251; x=1795017051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6G6xgqSlEM3Q4tZbFCHAlRdnKn4XyO0f5C8BowqYDo=;
        b=HWslet0bXk0MHEKSwvQtWnqj+XCU5eP8beSp/4UxMSKBygLM/OU/nk2ZqOxrHMw+i4
         cwkP9wlfhbE2slahxt1D0UNssfXa1HrJ4qzlgPx0JwuOE+eeajoUKsv3PGwaHYjs51h1
         v22veU6MKQInAqZYG3F9eePexGLLcvd0nKC/o8md6Z17vnFQRk07A0XJRnH/noqDPAPM
         JkhymjWCDGBQxAHvvGb3gXibhzLc9CbPxgPzHwJjhbFTmaK1hzdAubJKT6lkbnLNQaIm
         w447ob9GIcmlFkeWNDPSr77YWzeOs1AhFw+Mx7SRcUjnNsngMPB0eIevdJ0Ji6kudVMp
         td2A==
X-Forwarded-Encrypted: i=1; AL+hErHll78TD6NiIyOXonBC4ZR1VOwBCuMy6fDhuQPi524IuYQs9pGhP9SYP13xuqAuw8tyFabgH7E=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZPOKN3sPhrojNf3lyyMmz/8ha5joI7FJE61/txoHz95Ol6+Xa
	XoTUOabvrnr3U2/Vwne/6LPfc8uXx8G+tNrzJpJpGmouqUVN7K5Y7T9wyVx9SirYcak=
X-Gm-Gg: AYBFou2XwwNtEe4VeRgMH52XLU1tObXRX2Hxr71yR/Y01y68rvMaDAE8f6aM8uMX1Cn
	CzDK0/O4CC65vvuNjPRh3eg8VOeGi2P87Q6LAnBKw+hfocFebhRfZCnfYsakKAoxtwHBkPWD+Zn
	u5GXFrl5tI7m4O2/27VAxgPK+OVyu4wrq0hTqC1/2WYiwSPLKTqeHP5ozcb7qody3PxpceDA2pQ
	O52GiqjfbhV3oNGf8kre22nQQj4Wspi5MqFvSOEQYPS697RX15MfDvXcclS39YKk3S86A4trX3f
	m7BnvmfaE2sc84o5akz1rk4Mm1WnTRFy6xa8VU4XliFIYssXJYlTySpzlhf/RC0LmfXvjbL8Mlf
	uaLtb8y5sCw7LJRIPDXpHjSkWzzvUzKCz6j55HMPYxEhrXbhlxxHkCl9Wa5dktN7F6npXdwZQfG
	2eatwlIqO3gdunr8DMkYODjZm1FAWE+7tlQiYWADb0k9qO+7BCtrjq2984Ea5m2JPDx1qZkY0sW
	8vItBFJvBpOkFbXEvRXoKAplTZzozi/Glq22LlPzdqAZhghmOCeRld0PFnSd3vv6BxDN+cNB7vX
	d1HjcFOK/TrfxZ830sSYmUJQzpjVJjFGA3T1AbM0sZ2LmpuGfFCR
X-Received: by 2002:adf:e186:0:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-499c7ef33b6mr4307560f8f.55.1794412250750;
        Wed, 11 Nov 2026 07:50:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983f7801bbsm11742832f8f.5.2026.11.11.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:50 -0800 (PST)
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
Subject: [PATCH v7 12/17] printk: Separate code for enabling console
Date: Wed, 11 Nov 2026 16:48:11 +0100
Message-ID: <20261111154816.71103-13-pmladek@suse.com>
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

There are several code paths which try to enable a newly registered
console. Move the logic into a separate try_enable_console() function.

It simplifies a bit the long register_console() function definition.

Also followup patches are going to add even more code paths. And it will
be easier to use "return" when it does not make sense to try other
variants.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 84 ++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cc6c2e829b1d..5a2e6f1b9907 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4044,6 +4044,53 @@ static void try_enable_default_console(struct console *newcon)
 		newcon->flags |= CON_CONSDEV;
 }
 
+#define console_first()				\
+	hlist_entry(console_list.first, struct console, node)
+
+static int try_enable_console(struct console *newcon)
+{
+	int err;
+
+	/*
+	 * See if we want to enable this console driver by default.
+	 *
+	 * Nope when a console is preferred by the command line, device
+	 * tree, or SPCR.
+	 *
+	 * The first real console with tty binding (driver) wins. More
+	 * consoles might get enabled before the right one is found.
+	 *
+	 * Note that a console with tty binding will have CON_CONSDEV
+	 * flag set and will be first in the list.
+	 */
+	if (preferred_dev_console < 0) {
+		if (hlist_empty(&console_list) || !console_first()->device ||
+		    console_first()->flags & CON_BOOT) {
+			try_enable_default_console(newcon);
+		}
+	}
+
+	/* See if this console matches one we selected on the command line */
+	err = try_enable_preferred_console(newcon, true);
+	if (err != -ENOENT)
+		return err;
+
+	/* If not, try to match against the platform default(s) */
+	err = try_enable_preferred_console(newcon, false);
+	if (err != -ENOENT)
+		return err;
+
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (newcon->flags & CON_ENABLED)
+		err = 0;
+
+	return err;
+}
+
 /* Return the starting sequence number for a newly registered console. */
 static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 {
@@ -4118,9 +4165,6 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 	return init_seq;
 }
 
-#define console_first()				\
-	hlist_entry(console_list.first, struct console, node)
-
 static int unregister_console_locked(struct console *console);
 
 /*
@@ -4182,39 +4226,7 @@ void register_console(struct console *newcon)
 			goto unlock;
 	}
 
-	/*
-	 * See if we want to enable this console driver by default.
-	 *
-	 * Nope when a console is preferred by the command line, device
-	 * tree, or SPCR.
-	 *
-	 * The first real console with tty binding (driver) wins. More
-	 * consoles might get enabled before the right one is found.
-	 *
-	 * Note that a console with tty binding will have CON_CONSDEV
-	 * flag set and will be first in the list.
-	 */
-	if (preferred_dev_console < 0) {
-		if (hlist_empty(&console_list) || !console_first()->device ||
-		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
-		}
-	}
-
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-
-	/* If not, try to match against the platform default(s) */
-	if (err == -ENOENT)
-		err = try_enable_preferred_console(newcon, false);
-
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept them at this stage when they had a chance
-	 * to match() and call setup().
-	 */
-	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
-		err = 0;
+	err = try_enable_console(newcon);
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
-- 
2.56.0

