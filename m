Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412287;
	b=QnM+sfvDkmEiqJFszyAhSNrt32WxqmOYYU2jbvcHf0W6v+hkMTwGi10kBputTskjN4Ou
	 aY/Ihwg2lf6KhKAsO0eWibJwW8uM1HzSaIt7rnVtVl3BK+/ZruKmGFsnEHsiSPWtgAReE
	 wZcLEYRLqJzdumCbxmM/9uPyMZnhpjxiqQl6Mdhiv3y9Ln1Jy6TBgj7FSZPt0B9Esim+i
	 l/2Vo0PneieKzLrrzpIYeCCLsA03o94nfvWRcnK3E3Lg8V3Qo9cramTDDNrMLNuPwZeIx
	 vEX5eIyY1gLlrs4Rz3kJUgMqYvsX+NUULMvOTaoNlIeBL5txxyOOuY+FPLHg1q2SrHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7inFXUA9oiMxbV+Wia+1AU8bjdJLbgmzY+eZADP2uMo=;
	b=qO9kDne/9poY5rNlvPKTTB+x7X5fGzDSiMZi15pEdXcYRZC5UtwuuADCqcy7rlafOpSI
	 aYRw4Dgf5XwVH73bpdwlwqNxZmtUfqX9SHkMSSMqYnPYVxN5cb0j6RqEVTyBKRul1qWbp
	 twRmGDMkREbr2Y96POksr3CNGtBgIVyBj1E06+58zgFktkCFcQN0eyAp8ZARShFvv94Fb
	 pOrNc5j07LRsloJElQDNkasFf8Nxgn2fYSdmNjEAMenrR/r4/vH0RSqWeB+JspAtk/QBp
	 A0+3DRVQUBT1WKg4g4YprfOOLA61Kg5BAkcdWZ+FD9/5ShpRHNgcQ2DeSLbepzvezVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JfP51CMb;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B7606A8A9
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097B7606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JfP51CMb
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so27549815e9.2
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412285; x=1795017085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7inFXUA9oiMxbV+Wia+1AU8bjdJLbgmzY+eZADP2uMo=;
        b=JfP51CMbogabb7vxI1fYNS1AXsXX1mhtkeXJiah7MC1ig4hjw0A6mZlBscVVHAllm+
         VuFuI5AN+p2QuME6s1OHpk6p8bX2uC5gQvX5vNcQKOQ1/ZEw3ltuH2d0b0AEHOWwnU/9
         gwJ2XvpXM0WDCjIg46dP1eKOUGupgoxHsav7sqYLpQ1a06Dy6/1DPGuUs9sjpzMQZn7Z
         4f4Al6wp7Fv/KTq9PZuu0RfYqZRRmos/NuNf1wOUdh5SpHyelmyGhlc2r97i+2n89rQy
         kwru3We0SmLIut6Z2JNVR+qBfvwFVw0W6jUbhQAtZo+vmD0Ig0rs8HDKvlGkcGCCfvC/
         VqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412285; x=1795017085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7inFXUA9oiMxbV+Wia+1AU8bjdJLbgmzY+eZADP2uMo=;
        b=FLbOkJQrrp7dJ5JORFTbCkH7TsMptPaERLB3GmHPycBwHVE2ASkUWie98IViWBuTud
         1D9Kyemu2jMNZUYQfVjKqGUN7Cu0QE1qpdE3apNiPYL68azCS+3ShZVIPb8rdgNQCbjO
         fRwEDFBtqQRmtk1+bxgqYymjSgaDU2XYbXf8wEa7oKhChEaN5+cHu6mHgFsuppcleACf
         imPPmimFDUcCKmPhp2WJ9cczJWWx8HVGN6gSqAbKZqbv3eCgXiquxhipoY6piPdohiGy
         31cwLLRZUdTnApU0vwXiPwfqoWipd5fn+NUCHCK7+B/5hBThp9jccbG50gplEvJhAPXd
         2hww==
X-Forwarded-Encrypted: i=1; AL+hErESy+VWZp4f09kxh8zUFmTilUfEs+7FDbHNmp4gNSjif4LeFVjV8pRbLOToqPGUJE8PNT+xJuY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9BPBf9YdLDSEgxhbhZozwQdw5jRrFRb1Yfj1c/j5dESe2GOJZF
	5grIQMWAAtr22yttL7wvGaZB7+cYmk6F8y+qJ97stOnuRD4k5hVnUsYRiTpfN1yClx8=
X-Gm-Gg: AYBFou1GVCPZssHNjYEA2Og8K2akm3udIfpHG9F6ZhZSjBdVlNRds19/6ulBXg9wqKx
	pn+H9YH104+uyx3bhdwM+d1SMxtLvI6L2MUcO39YsEjEwfR5XimGn579NWEPvesBI8Dtcl9i7u+
	DvOg/hwNyeOwxBfmtFY726iFRv52MMmBu1/TWTN6WXKpLHNO+ZT6XrPGXIPiEkfySNPEG9ilfeY
	OdlkbTfHMPOCk7zOib6SVBXWKlhyeDfsu2saNhkiCrS65fAbzcQZOexIiaQ6eF2LMeQxhMq4Tuq
	sM/ymno2svJY7RaO59cIyomsZpY3OLL3UFl0LosnBEi+l3Wb1kUknEBfJb8g3qryNeHdBZiuilf
	GZtwkbbKThDdkvlbxhgvPIq/5od4KgdrOP0HwWSVGOqSNWjRa9XzTyZTgkhcm2baX6kH7mnjVQQ
	ZJEiRdUvQRf3sSv4kScaknGsyRjyR6qor3IyvXqlzSNYU7P5a8jqxCs1rPOeSzd4dO4UPPM3l6J
	EQwV8/yzRi1LMHjJJfLZmJQ7nzEmEbMLKKStn5UlZnZoLghDxZipZ43hejpJrwlR4gEHTi2zZpx
	E8nYDfbayLC/vExBxeAjreiKSdwL+uk=
X-Received: by 2002:a05:600c:1d18:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ba093a2dafmr48636545e9.24.1794412285481;
        Wed, 11 Nov 2026 07:51:25 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm7974397f8f.32.2026.11.11.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:24 -0800 (PST)
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
Subject: [PATCH v7 15/17] printk: Do not set Braille console as preferred_console
Date: Wed, 11 Nov 2026 16:48:14 +0100
Message-ID: <20261111154816.71103-16-pmladek@suse.com>
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

The Braille console reuses the framework for handling consoles preferred
via the command line. However, it is a special-purpose interface that
neither receives standard printk messages nor associates with
/dev/console.

Currently, the "preferred_dev_console" variable can point to a Braille
console entry in the "preferred_consoles[]" array. This occurs if an
entry was first created for a non-Braille console, but a later 'console='
parameter redefined it as a Braille console.

Since a Braille console will only ever be enabled as such, it should not
be tracked as the primary system console. Adjust the logic to ensure
"preferred_dev_console" continues to point to the previously designated
normal console instead.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/console_register.h |  3 +++
 kernel/printk/printk.c           | 31 ++++++++++++++++++++++++-------
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/kernel/printk/console_register.h b/kernel/printk/console_register.h
index 9ab3e1cc749b..64cf12fd6ea5 100644
--- a/kernel/printk/console_register.h
+++ b/kernel/printk/console_register.h
@@ -2,6 +2,8 @@
 #ifndef _CONSOLE_REGISTER_H
 #define _CONSOLE_REGISTER_H
 
+#include <linux/list.h>
+
 struct preferred_console
 {
 	char	name[16];			/* Name of the driver	    */
@@ -12,6 +14,7 @@ struct preferred_console
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 	char	*brl_options;			/* Options for braille driver */
 #endif
+	struct list_head preferred_dev_node;
 };
 
 #endif
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index d1481ae6c729..60a6b407155e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -365,7 +365,7 @@ static int console_locked;
 #define MAX_PREFERRED_CONSOLES 8
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_dev_console = -1;
+static LIST_HEAD(preferred_dev_console);
 static bool want_braille_console;
 /* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
@@ -2567,9 +2567,16 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   3. Only matching entries can be updated.
  *
+ *   4. Braille console is never associated with /dev/console.[**]
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
+ *
+ * [**] Braille console is using the mechanism for registering consoles
+ *	but it is very special. It is primarily used for user interaction
+ *	with the system. It neither gets printk() messages nor is
+ *	associated with /dev/console.
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2658,10 +2665,20 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (brl_options)
 		braille_update_options(pc, brl_options);
 
-	if (brl_options)
+	if (is_new_entry)
+		INIT_LIST_HEAD(&pc->preferred_dev_node);
+
+	/*
+	 * The last preferred console should get associated with /dev/console.
+	 * Except for the Braille console which can't get associated with
+	 * /dev/console.
+	 */
+	if (brl_options) {
 		want_braille_console = true;
-	else
-		preferred_dev_console = i;
+		list_del_init(&pc->preferred_dev_node);
+	} else if (!is_braille_console_preferred(pc)) {
+		list_move(&pc->preferred_dev_node, &preferred_dev_console);
+	}
 
 	if (user_specified) {
 		/*
@@ -4044,7 +4061,7 @@ static int __try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_dev_console)
+		if (list_is_first(&pc->preferred_dev_node, &preferred_dev_console))
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4088,7 +4105,7 @@ static int try_enable_console(struct console *newcon)
 	/*
 	 * First, try to enable the console driver as a Braille console.
 	 * It would have metadata in the preferred_consoles[] array.
-	 * But it won't be counted as preferred_dev_console because
+	 * But it won't be listed as preferred_dev_console because
 	 * it does not get printk() messages and is not associated
 	 * with /dev/console.
 	 *
@@ -4115,7 +4132,7 @@ static int try_enable_console(struct console *newcon)
 	 * Note that a console with tty binding will have CON_CONSDEV
 	 * flag set and will be first in the list.
 	 */
-	if (preferred_dev_console < 0) {
+	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
 			try_enable_default_console(newcon);
-- 
2.56.0

