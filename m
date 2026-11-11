Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412122;
	b=Fx1gRLe424jrlTOpgGUMmHsVPU/aBtDUjXbHAiptuqIYrdDnYsWZ7F6yoQGZRcPmn2/V
	 cIJyhZBS/W+ioS1Fwuz3uWOp0jcdTnQqdHoDSSKysGikQl+gc9B5VsmstxF+UAPj1RCxP
	 RklUv8ECyxS7Da4hTkvIkmiD7LslZKaDKvNAOYtkpR5LZ1IbZJ7L1ZkA4Ri2r+yI1E2Rb
	 sB/o7sOFtF+hAWG5kNdmiRIEUU/V0XX5GdTaMKWQFfdJ9ArPpK1JuaZHXwhimBUqOVbQH
	 GII3XF07PlHc/DiDBJbTluU2khDZuqZHcCoKTbpX+WhqGwOgcjzoNxfhSDmYbfAkslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
	b=CeXiX0WkulcWAgaHRzhNEI0ghNZ1RNF070V3iodZCkzXpyviG6fLJyXQARVGoCop+ioV
	 AqLRximmvHzR9tpKPsPPvne/D2vvOa1ook7WHQHStVt5Job/JGJpcJ8+etjcTADgEJuqd
	 TfKlhKuplNSP/IoSJVLGdV/QNKHspTaZ7QLAI2BRbl9FJ7/dUCVJn6F1sGln/On1IdP6w
	 dtiUAfo5gZO7qRVhpCh38oUmE44xlaNAQnK8llZ5cZ5RT+s/IYSNV/rkqc8n0k+OtDQTP
	 s4Z0fkTLlhT89Zy1HOpFTm/3CKfQy+8n4Omn7ImDw6w9Ng47D54gUXPliUDTWFeXjTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Yv03Mpad;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC169606A326
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC169606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Yv03Mpad
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4910b863b84so2129958f8f.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412120; x=1795016920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
        b=Yv03MpadImYqm4EwUPUVAgUMpXOyGL9Ho5r30tjUZm57yi6jK4XSnGVnC8E1YJfOND
         RCNkxS4MTroB1oDQ/uz0FnKqgcipehdrqDuJ9fRVyUfRRcbUu5PL1IJ3dl2w/FPgjnvk
         v9iX1G/v3nY+1Y/yyUPg6w5/AC5oua6aatOsl0ThUmnQGp/N1qi3HLzTrhgqTCdDPgqX
         ZvBm0qpGa3HNAN5ig8x62bIwHapVvBJ7HI+mwgwVyr/8AOyn2V6guUoAYRRl1TOjDSYG
         kgz09uWew1EJC9+Ijc0mnsUrf5eD/dhErSeSEQESzRpH1BcV5f9l68zpgAf/nv8DWqg2
         NpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412120; x=1795016920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJakC65jRiJycFPLrWS53C7JIcLuQtZw3EKWHlPXzoI=;
        b=XDKjiXGNI4lmktaH8uWmiqOO52tqDqQOwv0J/5H+5czYjGdZWy3S40o+ErV+svBznC
         wtgWFLF05/yS0ZQoWUHDIucIKjcB0Y7VWvy8QE/AF6Wh8qQpwD8teHz0I4SptKFiqtk5
         QIrKt5lqVUW8tPphT53IZzqzpeBBQazI+UKM8aJYwvCzgUqBHE/ijMW4TZuqinfrhoXb
         uRMYvsY5S+GcijlpuwR4/paa3b2oXqDI9Kpsbpe/8mRzPXsBSVNJ/MYHIS1uyP3aC9Xr
         iWjSInhnP2jYJ8I1xs59qxzNxztEXIyZ/6cxtL/Tq7+gYTsZ42rgTU3vWLRGv6CS8w4h
         3BwA==
X-Forwarded-Encrypted: i=1; AL+hErG5m4a8ytANXrvpRPu+N8SB9aAAVxmmaCE7z847VTdnp9eq0zU1ojShRge9K9/cGBuNJIeVeHk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/6Az4JeEk8h06kAClUBNhfO6wPK5xTjRWzoy8v4JxMF9FTTj2y
	O81gWWMkc7dIXh6Znwmjp7IvkeHRJzgC2Vs2m7OVfztxWcyS9GYxM2wzxu9tZXLMCOA=
X-Gm-Gg: AYBFou36tj54iaSldIlJPAuDFhBc1T78lc3dP0DhLeW+oEXBeyk6Xs2ehncUDHRHANK
	a0WxhPOD1rYXDx/yM5InsdmHYSfeV2jj3suebDDl+IvUJTkkB7JDNFZs5g3rTxjL3GXnVV9qW17
	JPfjzk5VjORKDHUZpWHIX31RDU+ASeeOXHe6feIyQgxsEWQXl2/972IdCpH3IevSzeUDMMx/9JX
	m0g7GOd+ZLnOSrep2GXJ8nfXULs6tbsCuiHbMF5Kz3zU2DC7m/RG92vadla/80pPfXKwDra1n77
	bm2oy+2qcxve6TeuLAaS+E4QvoQugfEw5eUXyhxDZ8SLEouFiIHIeAokUVJzfrORnKHdGz7O6Iz
	GoxuPlznA+ClsuiVdO5F1mUdgscp0n1ejvHpi74TQIBd3Qoi5LqtLjtsKMzPztWGAfNxdW8g59a
	Kr5riyQHkhehFDHOCTMJKmJ3u0Q7gl+g4DvJaaf77YdTLXbAJHf72K8v6zc8y3iOODzSqLO9vOA
	xWn198SMKLbzw9cXy6qn5x32uEujd9IExrKKlyJN5l49kJjL1he0F03fDm1UUdOw9Ca1j8gJej7
	QIkI4JP/EKzWle8jTFv7/UUJc9DOFMQ=
X-Received: by 2002:a05:600c:4594:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4ba0938142cmr50838095e9.17.1794412120095;
        Wed, 11 Nov 2026 07:48:40 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0953159dsm34230055e9.3.2026.11.11.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:48:39 -0800 (PST)
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
Subject: [PATCH v7 01/17] printk: Rename struct console_cmdline to preferred_console
Date: Wed, 11 Nov 2026 16:48:00 +0100
Message-ID: <20261111154816.71103-2-pmladek@suse.com>
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

