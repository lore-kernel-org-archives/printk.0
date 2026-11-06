Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985658;
	b=T3tNbIc8O7D3lmlOPOLMawT+kNeVT6af8/1sjgbgnxTOm+2RhGDuMeLsv0hGNDF5fuMq
	 VB8zg+/obBBqjhHzmamaZVZ+Wb+BrakzUySNzR5WzM5a44g1sTGD4LPB9ihlXC+fOOS+z
	 Bxi7dpi+EJ/u/sOGTUZs3a5wvb0R21c6/jPgag2eWAIZgb8v/Vk1O0H8C9bwPsC4auHkd
	 iBxdc3YyYJ1VUJjGqn3qYTY9vxGPrNReHCwuYjZnK2RyAV7RTy3SPpRBMRTNT3kWgoesn
	 lMcMDaX6MbbD3QK0ZUOI56kJ6Yug4ptB8S0bfHeOfkMngZ9ICS6ndE3PqgrDG2SqcHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
	b=AyasWoRxF9Vs035Z9kcx77CoWlS3XHA47GKMHUBhIrSGM7xPDj3DHBrrlMxWLuTfkFO/
	 bgA0p73aMYZeGSG9c49vtCKIWmKCu7pzjnbtSAr7TMzhbvE73KubDvYsxtbUoZJBnSyqQ
	 6R5NI+cWqc8qwFoP1iCht6xwohxkQUamy6pz+kfzeTPUiD6bWiJ2Xwq6lVgOPAAGhWEXQ
	 phbRSbjdwjmFHbZHqFJGPlc9I6amOb9BWjG+jr4yr7lgUKJniYN/Z4zY7ohWGihmYNsFt
	 iO32fUoSiLV3DcbzRsXYrPoM1B9TNPGkSS7DHqcGjWBrhAdIlBrDD3ff6KUsHcjBLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gu8w1hIt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A1606A326
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920A1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gu8w1hIt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4922dbcee23so518964f8f.0
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985656; x=1794590456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=gu8w1hItWfZQXazU5l7t7lk3h8iYc0QLKR4mIVSeP/PHTX5TGExqeInn/Gyqhm7pr0
         tuzknRh8eRysdbBXR+pVEkFiauOTp90bRqJ4NTWNUP8E6RaW7UPOh1asVtiAhSwhigMU
         elPxbISru7h7/E7uQukGogL6D8D2pD0DignoValk7Ds6dqClUPi8lIfcvWM9yKpwIa/z
         5K4qPATguaSrKnuyaKgwm/aQXOuydjTFzWt3M7R5goPUHNzgcYhXh2WKTaZRzKH6Y7zv
         t2Ez/92vylivSWqSMuOFv9fErx/T40zKWWEGdrO+UKSW4Zpa6tICoh6Jg/we4Uwm3unx
         8k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985656; x=1794590456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=xDKwbxzo2sAHOgljXL+68YhLPRWFJX4yOwT5OQiYN5CD8CKmF9rcuWm6BxUX7uZi9I
         lPgQT87ifWpsVMyUcAVA4W4/ZZDuM1xARM0nN5sJnMyR7HCHucJBUOxy3StRZSAduZkc
         qIP55KMDeou2z8+jKOiLvSRgi3POOOZB5alOKOLaNoUn9vEjOx72YNsv0t3sjWqORy+i
         RCzg5cTQJa+FgVlpyhfjsL0a5odXA39VUD366Q2zFH09X4kwwI8BvYqblSUgsUk/PWZT
         10FYL2PrWJ8h1U2GjWi22Y8k91p1vxeeE4qARm6HB7aTl8ZEgr0l3PjXoUJNoe84gXNY
         OJng==
X-Forwarded-Encrypted: i=1; AL+hErHoq/3ah3OsJ++5McpNkVLdkf5MNC3U7IVOThaG4tc/CednI4bdF6oGCkhsP5w1cZZpjLk3qQw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9M27lQIYXXJbDu+sBpu1uesh0TAb/yaYtMxiyc7cCwtT0kMJ01
	lY7YuprogNersRZtoJouQ6HhXSTlAYmhgnFo9NHSraXDcS4yTVzpQKa0UR6Wn485/tY=
X-Gm-Gg: AYBFou1Z5eBLnIMBe3UNkHt/G0cBXhPRei2dkWyi+lcMAEgQaREGOwZ5iVIV0JkqbDE
	/PNhWyh5MQUrMl9/JFBg0+ve/pX0QFD6VEKJ91wuvZvMpFokhWgYHOkYoOJHDsEPGK5SFWHd4gK
	eBKmf+Q5U+JNzoMi/gUt/8aoYoucMZVE4mjjjOQkDUEqNJs5NDc4enCIk3kztJC5Ht730Cw83mi
	LVtxOmW5Q9Z/4pex6Igr6NYi538/Ux8LIZMeNpNq4YWHxzPUtZlT1xIZ7zYWfiuW3QicPP8xWzE
	lWfDqG09+YyzjyTIXv2fzDbvM8LhO1V6rYbWhMg2GabZwoBh6LaB1rVBMpay2LG57sZNiO6kCMQ
	8usmcKzc24eRDNi9QjLv74Ep6i+dk78Dy/2eVOmp2iDFloxIfE+LXVY8q2dgrfgkIKNszIbrPwj
	EdGwMpRaLzPZ24FU7T55F6/L+UhnThori0L/ZaL9+yESxA/ioHcnW/uohJxZtxWe6fYMa9JgX6N
	uNcMIahDoJivhMOUrI3Z3Ghmb8r1Rcohyqb7ukDkTmW6oKy+KU5vxGW7HY6L8l1WWNMukOFZNcV
	MEPfZDJLPomBeAQrLgM5WywZSUijdJ8=
X-Received: by 2002:a05:6000:454f:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-4927835f07bmr4270427f8f.54.1793985655910;
        Fri, 06 Nov 2026 09:20:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7700224sm4957206f8f.33.2026.11.06.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:55 -0800 (PST)
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
Subject: [PATCH v6 03/16] printk: Cleanup _braille_(un)register_console() wrappers
Date: Fri,  6 Nov 2026 18:19:39 +0100
Message-ID: <20261106171952.207909-4-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
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

The _braille_(un)register_console() wrappers currently attempt to hide
implementation details like the CON_BRL flag and pc->brl_options. This
forces callers to handle an unconventional tri-state return value (0 for
NOP, >0 for success, <0 for error), which makes the control flow harder
to follow and non-standard.

Refactor the wrappers to use standard kernel return codes (0 for success,
-ERRCODE on failure). Move the responsibility of checking brl_options
to the caller to make the logic more explicit.

Additionally, move the assignment of the CON_BRL flag from the internal
wrapper to braille_register_console(). This aligns it with how
CON_ENABLED is handled. To maintain symmetry and fix a potential bug
where flags might persist after removal, explicitly clear both
CON_ENABLED and CON_BRL in braille_unregister_console().

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/accessibility/braille/braille_console.c |  7 ++++---
 kernel/printk/braille.c                         | 16 +++-------------
 kernel/printk/braille.h                         | 12 ++++++++++++
 kernel/printk/printk.c                          | 13 +++++--------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 5a3e375f4800..1b79b4d88bac 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -413,12 +413,12 @@ int braille_register_console(struct console *console, int index,
 		if (ret != 0)
 			return ret;
 	}
-	console->flags |= CON_ENABLED;
+	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
 	register_keyboard_notifier(&keyboard_notifier_block);
 	register_vt_notifier(&vt_notifier_block);
-	return 1;
+	return 0;
 }
 
 int braille_unregister_console(struct console *console)
@@ -428,5 +428,6 @@ int braille_unregister_console(struct console *console)
 	unregister_keyboard_notifier(&keyboard_notifier_block);
 	unregister_vt_notifier(&vt_notifier_block);
 	braille_co = NULL;
-	return 1;
+	console->flags &= ~(CON_ENABLED | CON_BRL);
+	return 0;
 }
diff --git a/kernel/printk/braille.c b/kernel/printk/braille.c
index 9d21a2bb1d38..593f83eb0487 100644
--- a/kernel/printk/braille.c
+++ b/kernel/printk/braille.c
@@ -37,22 +37,12 @@ int _braille_console_setup(char **str, char **brl_options)
 int
 _braille_register_console(struct console *console, struct preferred_console *pc)
 {
-	int rtn = 0;
-
-	if (pc->brl_options) {
-		console->flags |= CON_BRL;
-		rtn = braille_register_console(console, pc->index, pc->options,
-					       pc->brl_options);
-	}
-
-	return rtn;
+	return braille_register_console(console, pc->index, pc->options,
+					pc->brl_options);
 }
 
 int
 _braille_unregister_console(struct console *console)
 {
-	if (console->flags & CON_BRL)
-		return braille_unregister_console(console);
-
-	return 0;
+	return braille_unregister_console(console);
 }
diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index 55cd3178a17a..e9790c28027d 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -10,6 +10,12 @@ braille_set_options(struct preferred_console *pc, char *brl_options)
 	pc->brl_options = brl_options;
 }
 
+static inline bool
+is_braille_console_preferred(struct preferred_console *pc)
+{
+	return (!!pc->brl_options);
+}
+
 /*
  * Setup console according to braille options.
  * Return -EINVAL on syntax error, 0 on success (or no braille option was
@@ -33,6 +39,12 @@ braille_set_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
+static inline bool
+is_braille_console_preferred(struct preferred_console *pc)
+{
+	return false;
+}
+
 static inline int
 _braille_console_setup(char **str, char **brl_options)
 {
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 435c1b7148f1..a46c9bd184de 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3927,8 +3927,8 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (_braille_register_console(newcon, pc))
-				return 0;
+			if (is_braille_console_preferred(pc))
+				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
 			if (err)
@@ -4240,17 +4240,14 @@ static int unregister_console_locked(struct console *console)
 	bool found_boot_con = false;
 	unsigned long flags;
 	struct console *c;
-	int res;
+	int res = 0;
 
 	lockdep_assert_console_list_lock_held();
 
 	con_printk(KERN_INFO, console, "disabled\n");
 
-	res = _braille_unregister_console(console);
-	if (res < 0)
-		return res;
-	if (res > 0)
-		return 0;
+	if (console->flags & CON_BRL)
+		return _braille_unregister_console(console);
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-- 
2.56.0

