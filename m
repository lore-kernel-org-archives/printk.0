Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985634;
	b=2cTYq+8JdM3H+DKQDsR+gXm7y4kO2rsJ/gsHnwKwwoSxMOjQcShWyf1f5gkbM3taUL2A
	 7A+mhWT/XuyVrIcC+uiagDitUU+aKG/Xz9kSxTtIhF5P37k/+bZL/JykRGiHqdGGHbVR5
	 pw3oi8YC2OqnN/K7rxt6NMqIfR0yjbf/L5fijQUTRHnyHsSaILcF8nNNo1yMl2vxdNSmR
	 MWg4V5e5UjlX+jHAaMEhh3epOypqoSucRwouRguhfL8gpoBGL6ZlCo85eOphUQQ1xKF74
	 MrHz5pkieXdwtekQKsmrR66fGNcGF/fwH9fy+Nl35B4O2nCGNn2doDnKqBHHVc/lf6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
	b=h9f9AIQKWpeRvVOr4V0TQ6ONHSLJwKmeI5FqNWOFg+dOFpwgKY+CtYYOp/MhoyFKhHlC
	 +udoFauN/nE4/7sBXDS3lkRFwOuvzWxOvBod8vKqduFfv7kBrIjZYtqP/QiXLGywrB28+
	 rmGef1c3gLx7XdgkSEMVdfvkvU5/hJVYfIMTzVoD6ZYc6/WyLcIa1pHev4x0cPwUXBStp
	 GfcLsg+BE9xUfaSgRnBgTBe+7jyxWRy0gs7VwWEVXi2ftg/MjFOxexr7YnuJZ6aLz6fmG
	 ElLidcBaLq1tTlD2l05V66D8JyfvHf4hl89wxi6zV5SAKF8tH7NoE5GdBd/KphCGFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e0hrVoGK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AC2606A32F
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AC2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e0hrVoGK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8654205e9.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985632; x=1794590432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
        b=e0hrVoGKDchnE31VB1WTnzFCaVBKX9wPtgv64S9BD9q9cEuZh+3w4fD8x39M9rB7qq
         NFd7hSyEYlKmHtenVFofJoh3igGg90/rwEEblcV6hw6znl7BCFsQFUn3FPAxEZUoTvRw
         vOYXZSGOOQfxzwrIwW0xuDULQVwUqi02+7pcDiHV2o1O7AdWf1naog1EHuJ5cXsRH+Ff
         i7/O36q5MvNsJqgjGaP68o0EYcpE+MQk9Dw562LM8Pv4N8y6dQ36Mn7uVTDBisL2T+me
         f9AEyQv86e7zouoV5Q+BtbICHt64lnOibpJU1n5TnHyINqLGDUG5KbDqyfJjJS7uSJIK
         WSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985632; x=1794590432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
        b=Wo0e7RAMJaZCXloc5FUhh9ArdugNA18R80JVPBH8JuMmk7rBEVbWdP+CE4lxShj17x
         48eO2J84cvRJr5Yv5HNobYhyImNx3PD6d64/wT5FDrhiPTI4TsAWdhCQAdq0wmAOufNd
         niBqWOMTAKxlgBo3M3UbjNjyi+D9hmYIKc4vl48C5xtZOr52g0GBw2epAZSXZ2DG2Boh
         TUzVWO7C6hwPv1nAshd1frTb/1yrwUWPS8WSQJgEXA7LnNgddBRWKXdszsg+7CND86NZ
         O3Pi3B7AtC0O9J7oGMoX6ymzvm8HbdURUoRq88vJW0KF1XnnuPi+tpD3psfM/hr+tVCD
         bftQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA+RVEoNuwtl0gQP2vVCzi+/lrKCeLFMd9kW9BeNu3AxT8vPmYAQAnd808K8VuYy3kBjwSLt0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZyzFBumDaVrtYNO6MZr6uXodZXW5rcPPba5yqLiKl6IoW48vx
	/aIxM4DFAg8paFAV/xoZlfqi3NdR9cZM0n81LC7zBj/oLGn7GbRZEEYJq6gmyaRzRqQ=
X-Gm-Gg: AYBFou3OaSMWUmDBbKsdP2zlIQjt0qwIf7DbcO76oPBpTbdJtDwP9Wf8z2wUr1vbO5r
	JyR7CPK2T1CEuCaavZ345QrhpW3qzP+jSQy+rFoEOu22Jn8TyBBEGstUKYDPmXu9/ZIqAx2mkiQ
	3mKDaERje4uWPqoZwtrT5FD63BXCo9Qxx4I3PmnX0rSY7468SLNTbLt2sSNU2JuZgRE+w8F4FcB
	HqAVCbTWt+4gqqo5ENXY5ZVdpk8AW/4PevLzJMvvNmxVVtmeV3glhRXNUMPL572gevhgniRtXvy
	1O3AfEm1HrwZ7Yt882M7Hp8+WGWIUON1huI34yW8Y7ay6d+u6GB8NjGYmuVbbIUBtbYqV9ZinCq
	7Extes/2+jFqwZ3y3izGwfYlaNe52I7ZvVgXA+M+T/RrVI7jtfNUCs5pNtEdca1o4FmXuAAec4n
	5QEJ5FI8COtqozne/xPP9b6rHwzcYwmnu7V/PSt37qrV4N5t0HPJll7ewWOhVqQOHc0moCtMczU
	e6nH4RnE3dOSzXKjEthRwym+5QDatbKhTpkCW4P66vD8mgfMbvhih3UxAz3nKe1Z7DFXvguKjIb
	Sdq/hjCyeV1JBVvtMyWD7Es+BzfG2cFRhXd1bVh3uXxbOanDFQRn
X-Received: by 2002:a05:600c:1d05:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b6dc4001b5mr52654515e9.1.1793985631961;
        Fri, 06 Nov 2026 09:20:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e168f73fsm77045555e9.5.2026.11.06.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:31 -0800 (PST)
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
Subject: [PATCH v6 01/16] printk: Rename struct console_cmdline to preferred_console
Date: Fri,  6 Nov 2026 18:19:37 +0100
Message-ID: <20261106171952.207909-2-pmladek@suse.com>
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

The structure 'console_cmdline' was originally intended to store details
about consoles defined on the kernel command line. However, its usage
has since expanded; it now stores information for consoles preferred
via SPCR, device tree, or by particular platforms, e.g. XEN.

The current naming is misleading as it implies the configuration only
originates from the command line.

Rename the structure and associated artifacts to better reflect their
current purpose, for example:

  - struct console_cmdline c -> struct preferred_console pc
  - console_cmdline[]        -> preferred_consoles[]
  - console_cmdline.h        -> console_register.h
  - c			     -> pc

Additionally, renaming the header file to console_register.h would
eventually allow to decouple console registration logic from
the monolithic printk.c.

Finally, renaming the local variable from "c" to "pc" helps to distinguish
it from struct console variables. Note that "c" is used for struct console
in some code, for example see vt_console_device() function definition.

No functional changes.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/braille.c                       | 10 +--
 kernel/printk/braille.h                       | 10 +--
 .../{console_cmdline.h => console_register.h} |  6 +-
 kernel/printk/printk.c                        | 89 ++++++++++---------
 4 files changed, 58 insertions(+), 57 deletions(-)
 rename kernel/printk/{console_cmdline.h => console_register.h} (83%)

diff --git a/kernel/printk/braille.c b/kernel/printk/braille.c
index 17a9591e54ff..9d21a2bb1d38 100644
--- a/kernel/printk/braille.c
+++ b/kernel/printk/braille.c
@@ -6,7 +6,7 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 
-#include "console_cmdline.h"
+#include "console_register.h"
 #include "braille.h"
 
 int _braille_console_setup(char **str, char **brl_options)
@@ -35,14 +35,14 @@ int _braille_console_setup(char **str, char **brl_options)
 }
 
 int
-_braille_register_console(struct console *console, struct console_cmdline *c)
+_braille_register_console(struct console *console, struct preferred_console *pc)
 {
 	int rtn = 0;
 
-	if (c->brl_options) {
+	if (pc->brl_options) {
 		console->flags |= CON_BRL;
-		rtn = braille_register_console(console, c->index, c->options,
-					       c->brl_options);
+		rtn = braille_register_console(console, pc->index, pc->options,
+					       pc->brl_options);
 	}
 
 	return rtn;
diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index 123154f86304..55cd3178a17a 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -5,9 +5,9 @@
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 
 static inline void
-braille_set_options(struct console_cmdline *c, char *brl_options)
+braille_set_options(struct preferred_console *pc, char *brl_options)
 {
-	c->brl_options = brl_options;
+	pc->brl_options = brl_options;
 }
 
 /*
@@ -21,7 +21,7 @@ int
 _braille_console_setup(char **str, char **brl_options);
 
 int
-_braille_register_console(struct console *console, struct console_cmdline *c);
+_braille_register_console(struct console *console, struct preferred_console *pc);
 
 int
 _braille_unregister_console(struct console *console);
@@ -29,7 +29,7 @@ _braille_unregister_console(struct console *console);
 #else
 
 static inline void
-braille_set_options(struct console_cmdline *c, char *brl_options)
+braille_set_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
@@ -40,7 +40,7 @@ _braille_console_setup(char **str, char **brl_options)
 }
 
 static inline int
-_braille_register_console(struct console *console, struct console_cmdline *c)
+_braille_register_console(struct console *console, struct preferred_console *pc)
 {
 	return 0;
 }
diff --git a/kernel/printk/console_cmdline.h b/kernel/printk/console_register.h
similarity index 83%
rename from kernel/printk/console_cmdline.h
rename to kernel/printk/console_register.h
index 0ab573b6d4dc..9ab3e1cc749b 100644
--- a/kernel/printk/console_cmdline.h
+++ b/kernel/printk/console_register.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _CONSOLE_CMDLINE_H
-#define _CONSOLE_CMDLINE_H
+#ifndef _CONSOLE_REGISTER_H
+#define _CONSOLE_REGISTER_H
 
-struct console_cmdline
+struct preferred_console
 {
 	char	name[16];			/* Name of the driver	    */
 	int	index;				/* Minor dev. to use	    */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a205f94bfac..b8d62fec2569 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -58,7 +58,7 @@
 #include <trace/events/printk.h>
 
 #include "printk_ringbuffer.h"
-#include "console_cmdline.h"
+#include "console_register.h"
 #include "braille.h"
 #include "internal.h"
 
@@ -359,12 +359,11 @@ static void __up_console_sem(unsigned long ip)
 static int console_locked;
 
 /*
- *	Array of consoles built from command line options (console=)
+ * Array of consoles preferred via the command line, or by
+ * some platform-specific code, e.g. SPCR, or DT.
  */
-
-#define MAX_CMDLINECONSOLES 8
-
-static struct console_cmdline console_cmdline[MAX_CMDLINECONSOLES];
+#define MAX_PREFERRED_CONSOLES 8
+static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_console = -1;
 int console_set_on_cmdline;
@@ -2544,16 +2543,16 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
 }
 #endif
 
-static void set_user_specified(struct console_cmdline *c, bool user_specified)
+static void set_user_specified(struct preferred_console *pc, bool user_specified)
 {
 	if (!user_specified)
 		return;
 
 	/*
-	 * @c console was defined by the user on the command line.
+	 * @pc console was defined by the user on the command line.
 	 * Do not clear when added twice also by SPCR or the device tree.
 	 */
-	c->user_specified = true;
+	pc->user_specified = true;
 	/* At least one console defined by the user on the command line. */
 	console_set_on_cmdline = 1;
 }
@@ -2562,7 +2561,7 @@ static int __add_preferred_console(const char *name, const short idx,
 				   const char *devname, char *options,
 				   char *brl_options, bool user_specified)
 {
-	struct console_cmdline *c;
+	struct preferred_console *pc;
 	int i;
 
 	if (!name && !devname)
@@ -2581,30 +2580,30 @@ static int __add_preferred_console(const char *name, const short idx,
 	 *	See if this tty is not yet registered, and
 	 *	if we have a slot free.
 	 */
-	for (i = 0, c = console_cmdline;
-	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
-	     i++, c++) {
-		if ((name && strcmp(c->name, name) == 0 && c->index == idx) ||
-		    (devname && strcmp(c->devname, devname) == 0)) {
+	for (i = 0, pc = preferred_consoles;
+	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
+	     i++, pc++) {
+		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
+		    (devname && strcmp(pc->devname, devname) == 0)) {
 			if (!brl_options)
 				preferred_console = i;
-			set_user_specified(c, user_specified);
+			set_user_specified(pc, user_specified);
 			return 0;
 		}
 	}
-	if (i == MAX_CMDLINECONSOLES)
+	if (i == MAX_PREFERRED_CONSOLES)
 		return -E2BIG;
 	if (!brl_options)
 		preferred_console = i;
 	if (name)
-		strscpy(c->name, name);
+		strscpy(pc->name, name);
 	if (devname)
-		strscpy(c->devname, devname);
-	c->options = options;
-	set_user_specified(c, user_specified);
-	braille_set_options(c, brl_options);
+		strscpy(pc->devname, devname);
+	pc->options = options;
+	set_user_specified(pc, user_specified);
+	braille_set_options(pc, brl_options);
 
-	c->index = idx;
+	pc->index = idx;
 	return 0;
 }
 
@@ -2624,8 +2623,7 @@ __setup("console_msg_format=", console_msg_format_setup);
  */
 static int __init console_setup(char *str)
 {
-	static_assert(sizeof(console_cmdline[0].devname) >= sizeof(console_cmdline[0].name) + 4);
-	char buf[sizeof(console_cmdline[0].devname)];
+	char buf[sizeof(preferred_consoles[0].devname)];
 	char *brl_options = NULL;
 	char *ttyname = NULL;
 	char *devname = NULL;
@@ -2633,6 +2631,9 @@ static int __init console_setup(char *str)
 	char *s;
 	int idx;
 
+	static_assert(sizeof(preferred_consoles[0].devname) >=
+		      sizeof(preferred_consoles[0].name) + 4);
+
 	/*
 	 * console="" or console=null have been suggested as a way to
 	 * disable console output. Use ttynull that has been created
@@ -2732,19 +2733,19 @@ int match_devname_and_update_preferred_console(const char *devname,
 					       const char *name,
 					       const short idx)
 {
-	struct console_cmdline *c = console_cmdline;
+	struct preferred_console *pc = preferred_consoles;
 	int i;
 
 	if (!devname || !strlen(devname) || !name || !strlen(name) || idx < 0)
 		return -EINVAL;
 
-	for (i = 0; i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
-	     i++, c++) {
-		if (!strcmp(devname, c->devname)) {
+	for (i = 0; i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
+	     i++, pc++) {
+		if (!strcmp(devname, pc->devname)) {
 			pr_info("associate the preferred console \"%s\" with \"%s%d\"\n",
 				devname, name, idx);
-			strscpy(c->name, name);
-			c->index = idx;
+			strscpy(pc->name, name);
+			pc->index = idx;
 			return 0;
 		}
 	}
@@ -3903,33 +3904,33 @@ static int console_call_setup(struct console *newcon, char *options)
 static int try_enable_preferred_console(struct console *newcon,
 					bool user_specified)
 {
-	struct console_cmdline *c;
+	struct preferred_console *pc;
 	int i, err;
 
-	for (i = 0, c = console_cmdline;
-	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
-	     i++, c++) {
+	for (i = 0, pc = preferred_consoles;
+	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
+	     i++, pc++) {
 		/* Console not yet initialized? */
-		if (!c->name[0])
+		if (!pc->name[0])
 			continue;
-		if (c->user_specified != user_specified)
+		if (pc->user_specified != user_specified)
 			continue;
 		if (!newcon->match ||
-		    newcon->match(newcon, c->name, c->index, c->options) != 0) {
+		    newcon->match(newcon, pc->name, pc->index, pc->options) != 0) {
 			/* default matching */
-			BUILD_BUG_ON(sizeof(c->name) != sizeof(newcon->name));
-			if (strcmp(c->name, newcon->name) != 0)
+			BUILD_BUG_ON(sizeof(pc->name) != sizeof(newcon->name));
+			if (strcmp(pc->name, newcon->name) != 0)
 				continue;
 			if (newcon->index >= 0 &&
-			    newcon->index != c->index)
+			    newcon->index != pc->index)
 				continue;
 			if (newcon->index < 0)
-				newcon->index = c->index;
+				newcon->index = pc->index;
 
-			if (_braille_register_console(newcon, c))
+			if (_braille_register_console(newcon, pc))
 				return 0;
 
-			err = console_call_setup(newcon, c->options);
+			err = console_call_setup(newcon, pc->options);
 			if (err)
 				return err;
 		}
-- 
2.56.0

