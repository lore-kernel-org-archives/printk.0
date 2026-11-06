Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985787;
	b=WG4R71zOgBq8N8Xi081GQUnDwzhKts/lo30eERHMm/bTHPmp75VjodnojYD2OUxsK3iJ
	 Hx18/e7FoIOkbS+oNASj+JqDjdmYOYy83PUDu2Mk2kDoYSbnhCoYQ0/3uI+yNnNpHzuVE
	 m0gMy/Q2OQKTmYeB07oQPsuFbIjrk2l7+QQjd/yYB/DooIPNtEDBkZxSmy/FhHGyhC/FW
	 Llr4voPTEC/f4isVQn1IpXOG2r9KEYTm60CGYHkIMPGEd7npGuQ6yP1lmfv+QPLwaE8gf
	 rA5xfUGbvDn6neikupj/ispTXy8VN86cSPuiroPxPScT1G0B7Xm9jYdMQtk//6blnyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lP5gdhjlWCYnG9aSG/nvYTwv0o/lXe1/1V8+CbFrcw8=;
	b=Zg4Gko6aqZ5faH79Y69Ua5uDRO/D5a+1C2o1WLmRxuYdeA1RKuLmQ/Q/FOZjYmhvymH4
	 eO8ESfujVYiAO75lGZzUZeh1LVeCYAG+B3bdxeQS28fnnhvbnuofCuXuE8QbpfrRCQpC1
	 tK1Ey5BmQ5Ml0fCKhpJiKBNSi5taNvnTslAo4IvxRy9NdbjE5xbQ2vD0WTqy6N9B7HF2i
	 IFZ6XBAy7CJU9a/NuvIskxttiQ0AeGHOPTBF6X/hCxEyS/b+kCNYeWkHWXY9G08+XSEHm
	 ipjxEKwkAahn2hbH/hqbqJSpfxQuCUh1YE+5raFMGdxRCBJp0xMglEzkQz090fj/JyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KLPUJcdf;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F4606A330
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KLPUJcdf
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso7760235e9.0
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985785; x=1794590585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP5gdhjlWCYnG9aSG/nvYTwv0o/lXe1/1V8+CbFrcw8=;
        b=KLPUJcdfIR6zo9UdOOUC9RqqHS66w9JY/iOCwrqNqPhSTeV0pDjpU/yvLcdc3XuVrv
         3Ht3H7eEyqfYaV4Bt3NMIGIFSWcbFiuMO2tgVIa7dLpi/7W99IYNHM9eYr1/G5vM3JeC
         MYAb29M57xVB+PgJMf3f1CYpAOqfRs3vswlRdtAV0yU4evre3ElOs7K1hj04t5Wx0O8V
         NpFOpgYvSmtBytL9C2mSucSEV5kV7QYgnMp7As+W779BVFVi/edRdAxwjsKOr6uqWa7w
         BHQnfTGuhGXFK8l+Qtv3yk0fN0x47aqPP7ye/wq0qqGABV2JppnY+Ha5AlTilb3wOxgF
         DZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985785; x=1794590585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP5gdhjlWCYnG9aSG/nvYTwv0o/lXe1/1V8+CbFrcw8=;
        b=m5ztP3O5k3QZIijQqeC84WNB+SR+jFHP85nQrl6Qt5gqML14pEAtLl8VTXjhx/fntg
         xVN9SI+EzTvEpFqNBYho06XQnEiFfLusPLBBwQTFvSH41IMi0+skRbtE0+6qTGva+uOB
         aE8lDQfriijabUCsuqOxNmTi+RSY8dWBZZIMaWQwYQeKt04HLjBkJcX1cN4oekaSOEvO
         jll38V3x7S5NglHAlQbhFUccxlYbfI/AZddoPgp1JErdv4/+XwwZz3eNZtgv6wvhi5TJ
         oEn6tw0fP0ZvFpIquN1CkuN53y7lP15TApEeU2k4mmzNBz3HRh8ZNOnVRdVuxsvJM0Sl
         HaTA==
X-Forwarded-Encrypted: i=1; AKwUvBxh3PEVrmXtRrNlnEPIgmpftpAyILH5SbCjn2+WwmAgnKD8hIKxkn2bd5lu86tJjjlA30yxE7I=@lists.linux.dev
X-Gm-Message-State: APuU4Z+WBQSZ6vDsNN14daH547YkZFwImUq10FAP7we+iB2qe7IXILVt
	6h2IYgZI0b3tWpWvOh6B5ikPhPeF2CaQER3xLK+ReGTZOGrw7u+onxHS7xWhE4H812c=
X-Gm-Gg: AYBFou14vFsOMV3I31uC+UDR0fC8uBS/16qEs4W03gsKtKiYoen52raBK/evHmWYvm6
	lcQ34QpHNdAbCVbTYa1H6mXJJefUHxu69hydV2iPgKoliLKVNgwScPskQnnPEHSq8b1CCja6avS
	EBQwnFPDziwIfxkR4SHyEAwvJRr+g9BCYXd8d4uM2n6KZs06xA5QC5hRMcUfUQLs/p64tZedo6w
	ltEY8YlSKS8PPhAT49+v4mCucw0NTL6EMQChXvrVexmt6gJEJSK1nAiBa+kigfJ8FSwwILEPzH+
	VSkGO5WsQTRKkfNNfxlZyTn6+7ad/K+IBL9aJdYaUW1juRGUsmTNKBM/nODrRzF6fHOaNwtMgko
	k8aSk1+cwWs7OhFs05qU+dKbt39FnGYb9tZtVjGcqN4U3KTRE/mf6Jhp7bh1yURg8NWb4BuWFd3
	QuCYrlncbCx1CHDtU83BZKKrcvuW+rkMMZ+U2lce30XoEcOlyOhax3X/5GDiB8neS3VHrXz0mRF
	CY+StWKDrC7jbbN9QpWNDiMkYKLi8KsdrFYgRZfM/gFJ3IpyOTRjjt7Qllp/AweIKVnuN0RAb73
	VZI6GqlWZAmyV3daUoRH3Ao5AgYGFo0=
X-Received: by 2002:a05:600c:6306:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4b6dea69843mr63600315e9.10.1793985784675;
        Fri, 06 Nov 2026 09:23:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm274220755e9.2.2026.11.06.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:23:04 -0800 (PST)
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
Subject: [PATCH v6 14/16] printk: Do not set Braille console as preferred_console
Date: Fri,  6 Nov 2026 18:19:50 +0100
Message-ID: <20261106171952.207909-15-pmladek@suse.com>
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
index 2bcf82b2c4e3..5ec34dc2d168 100644
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
@@ -2649,10 +2656,20 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
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
@@ -4035,7 +4052,7 @@ static int __try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_dev_console)
+		if (list_is_first(&pc->preferred_dev_node, &preferred_dev_console))
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4079,7 +4096,7 @@ static int try_enable_console(struct console *newcon)
 	/*
 	 * First, try to enable the console driver as a Braille console.
 	 * It would have metadata in the preferred_consoles[] array.
-	 * But it won't be counted as preferred_dev_console because
+	 * But it won't be listed as preferred_dev_console because
 	 * it does not get printk() messages and is not associated
 	 * with /dev/console.
 	 *
@@ -4106,7 +4123,7 @@ static int try_enable_console(struct console *newcon)
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

