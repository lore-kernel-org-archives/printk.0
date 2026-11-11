Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412146;
	b=D1MW5+cEHqJHt7Lz/KfYM/xL9pEuzlMeDIL+CMIBhdg+1VRwo2Iz7umjBcHgsALApeQT
	 1TUcFX7WIjD1ppwm2QKhn+on1T8A/9uMSQLrcJzW9eaKmEBkXVqipcu497YpFLTF/tUvm
	 JGqlnbXHqrWWDYmmIuwNceQMscfVSfPdXgqPRUY41Z4zGnUhFo+RAOjsruHd/w7IwfSjK
	 TAQd1WvGtvDEki0DkaU2igZ4tIUu+ViWMTabFsq3XFeqSw8NVTD2PEFcmTU3xLGRZjVYb
	 4BaNAPyBeIJzk+3kecMp5xHcYhN9AluLgnea92+AAxCVxE7DsFL/Nhm4PdEOholovBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
	b=z/uckJB1rb2/S5O6sSiTIGlu1jQ6rW2vdIu5NfD1PKr34hoj/WCDbJKGN3lmyz7Oz72E
	 n5SimprmssZ/TaGGW1n0446VtP4zoOiTzfqwPQejYgQEys2BZfeQQR4d4l8DzvYbdSQ4D
	 AG648vwyO9illXph961cPxZyEr05a23O3EtQKemKwR0Pw4dWVI8YNNrYfWGbD7PGvCPmZ
	 wRVDNh7sdzTVUVYIN+85uB/s5MD5QluiGmmLD7pi+qLtSEQlTLvuugVp8il2wW/z9OAbV
	 oGR442tDop3fimrhFpwc0stBNcHZ1rqrvC1nU3xadXrK+ea+kQJXJuEOm3uSXA5X0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RdwTsvFM;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446D606A326
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B446D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RdwTsvFM
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25652895e9.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412144; x=1795016944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=RdwTsvFMoJKaRVwrxbOC4lMJAUIWZWItwC6e47kkSRHDjW0649bvJpZdWwOMQySFgV
         p25Hq8X+kOrejJXMJTwLIhzKgeXAZz0Gr/JaVzG8V6dHQedEcBtYULxt2yWP/jGitoYI
         ZEAX5Bx5RPZ6nJOWJUH3ESuGg/otI50zeHLek9fAZ8BHX+Z/iGzg/cO74wx6ddNrD/xU
         80WHZEXc9fimTYFGwOYBNfEQVwCE8XTceMIqR1PuJW1pCeJcyZtYAUa+HaEjfT809Gix
         CVeuk6hXjqUAOPVpXbs7lxutCiFfQNouxlTqm0KfVR3iCeimymYhn2PvKoyjjsvroBjd
         rgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412144; x=1795016944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKhciZOkgxjlFHYeRZEOqDiSFFSjwjv3a9/X/Qk+1VM=;
        b=kbti2BQgOuMYoTFVjulCnzLSBbKMdHTe6k68lEopMw9ODhd5oCRBkjIhaMGU7yVwwD
         +es88egte0wTS9RHNBAhv6NvBcBcFx/XlSdUTE+KzneqB/hA85cb8tE2SEXojtYAPxZS
         KQIgh3WI05oCGwcj3BfwtVglfKkWctWTldaNHZ40R8Q7UQMxq0IFnW70Jn06Uof3nnhM
         7DlpK+pvzOBNlTbB5Gb3yBgUnX0CbynjhLYAofNzhxXG69TPIbbbszTV4Pj3OC6rRZds
         dq0sMBsTf494zwt9eqg16U+kapLwhMLBUEpY4Fsohu4pFc6hQZDqyidPvl/pgQ2xKylV
         +IGw==
X-Forwarded-Encrypted: i=1; AL+hErF/PZgLMkwdH3bQ1xvBhbFgTFUXYfvC46Aca4S27PVK2SrJKheikv5WrS48O6DUlLg83G3zqdQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/+wwu7kH+57xrBOpIFuW1683bl1gtwc1n/29PbMPk/COMEp6yM
	d8bFgIN7qUMciEOzVdx7ChXzXZutQFsTm5PBps/U7yo2ndaX7sAUI26VyCDddvoFjJE=
X-Gm-Gg: AYBFou06HCULPvkTcHcZdwISK5sKkgnqRdHlfeuOxKxNiI8g8r3DeSalipImr71hNpn
	VubseqxrK7XfMfDc4LagXwHWKXtHi3MIRgA1dLPbvgzc/DXeg8KfLW5aQz8dpiIm3kPVCXGpJz8
	x0pd+HWX5a6mzablQQ8d76FjHzFg7dYFZjHW0b6A+UdFULaq/p2Kob1coXjoLF/Ri3VdDxKWqqE
	FhzkIJN5h4/n+NOdrw84GMvrQ2evQjLuXLU9TUfn0BjdYA05BgJKvQFeke6ipfQC6aMoepyId5W
	qCIIq63ZHfqRabYGJM0x5TRT9U+B0R93U8JRHXQBiYglYYT8IBVt7m6r3UXhxrxugnQCeitoXx9
	b4EuhoOPkiZZiqCDklNGaQkzielMV1RS4YY6YprTZoDRpswO9HxwnmV+zyCQQIWMHSj0x05eGgf
	N4l4X4pRY/oFeEIgpy7IqYzZ0ViW67GgUQw9+h88d6I5k+O+eMLUAxP1BjMJUr7SvBX0LpwFLt9
	wrv4jMvGtuTLbGzAZ4/rYL6EKntebGDBtq2zKBUspQAgHj9ai8FzGG+icuay/9Fjk9Ub3C7L/3t
	RyF4QOlvVhtZlx5SB31f5S/nzSSFT7w=
X-Received: by 2002:a05:600c:8707:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ba091aa248mr53695105e9.0.1794412144016;
        Wed, 11 Nov 2026 07:49:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c4a3d30sm5695565e9.0.2026.11.11.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:03 -0800 (PST)
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
Subject: [PATCH v7 03/17] printk: Cleanup _braille_(un)register_console() wrappers
Date: Wed, 11 Nov 2026 16:48:02 +0100
Message-ID: <20261111154816.71103-4-pmladek@suse.com>
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

