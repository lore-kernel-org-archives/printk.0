Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985670;
	b=HwAZz6I+4ACBfHQxcwLMVqqPdoprC2si/CFB2rf+0ZsrfgHfRT1qfZ6OKnmkob4OY2c2
	 9Ir2t6ThMCjlcRV3VMcITgn8pyyesRhiuhoahFeF4J9Havs0AF42jLD+xrh8HXqi8FOgQ
	 CGPMIIWsrA9WF0MHY6dWTZxi0oW/+G6+uRi6+6DwwtpN51Lq4XCpE/bS2hH0eiGQpwvPX
	 ON30gFB4rlhSvvOOEXI6/oinoIUxx8q7Ua9bPxHPdYxnR9lXzbRqCBP8tZrUwAJ2GkfeE
	 Wkq3z230yrETCK4dDMSJ9k2RsjxsxBmK6efHfxAw9p3xytrFSnMiABzcACbtkrc8I/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtI2f5FgGDg+mdmprwJofy8UDryNlfF3afVfUrT/OrQ=;
	b=2qOuZTHiR7Bd4lkymHfoYDfIX8bJv1gzKlLXd7GslkN9e8oHuG/jc+jFPIBYVkvjUVXv
	 0yzXv2w4HvF/3Ws5CXIwz7NcYHXtxuFVwbJjn8+5rQ5Fcn8fNAnQjtE8sN1oL79DRlUm+
	 KadIdWbutlTvYNvfEzztlcNxpFrPKuLOxLV5G3EGbFBgoykkeAdj8KD7hdI3EH2iWwcXF
	 UVbeNLJfotD+7JcDIWlNMpckhADQQ9zQocUO0YeaskbHd0/L7e0TtVblgXn+1pT9fJN2Q
	 W3AnfPTOrtpPPokkN1DIHcpqNCQeN9QBLaOribp/uM+ymXukj296DnQ+MG1dtQgmYGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Zw7ejbc3;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1E606D820
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF1E606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Zw7ejbc3
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so9229265e9.3
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985668; x=1794590468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtI2f5FgGDg+mdmprwJofy8UDryNlfF3afVfUrT/OrQ=;
        b=Zw7ejbc3ESfEDS5uS7Aei0tJcIwP+CIMmIPvBgMX8F8s/L6FzTQa3BxQy/FVEZdHNj
         LxCsDZpP0fECD7QpIs5iy4EZBd5AoEEtG5dx57RbKApRSj/gLHeVYKDwgBSRGHANFKLo
         4M9pBEqpaYEEBvofEfGsU+v/LfgbR3f/mO6eFkOmNPoM0np3VfOxHAv9rFeXOjMWSF3Y
         /imzNr0VAU+iFNzb2JUvdgDD8l+8V4OCu67qqAGTnSbAnM0M07re8Dxq8uy7WKtA+M8k
         hcGjcJy7LxYDkWNXcBDFnnbmDcUx1EW3UxkSmmd4ElppVXQUCFLvW6jOsbjj5rsSO1lK
         CeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985668; x=1794590468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtI2f5FgGDg+mdmprwJofy8UDryNlfF3afVfUrT/OrQ=;
        b=qSsShDFY1RJKQGEPHvwAFBdWQ+PREYwFirl0EbuMdyO7pcBsT+bXIkWs8c9uxxq3gg
         c4ZkJCSouwdNeG/qEVCH2LLA0MZtMqVxSFdiw6zpyU3/j7zT8nkLrJASoEm1x/WMXhvh
         yt0gxlwvjJnNc2XpJf8gecYTUItgY6dM6Gaj9W6WTj6sye6BKWfv3OQKum02mEKqJxjk
         1zUsRkL9ovR4umJ0SAQP6DgDWZY3DwXlILKVuT7G0xzpIlGS5tptWHT0DLgyw12thvcV
         rLCUFmEqbD4GXMh4OBthQyJKYBGd4Jp5HokhWlQ6jG/I+DZi14u4VFyNVsSuEExkBY4X
         5MTA==
X-Forwarded-Encrypted: i=1; AKwUvBxTssL0+SCIXvLEyPNlBwspRvApCA7525W73Dgbd+s1lyfeCNm/vbdkuoi2nNVDT0HeG0RHVJY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8FO0GetzBpTFc5Wq/jkZ2df3S9FyYvsGQ0bKEwZJdRhKFKLbsP
	cB1vBDe4hgR8NM63QwOhqQ9t4wVKOu34IvhXBqLrm23ONrn16KfVNh4LHp41kkfEQeA=
X-Gm-Gg: AYBFou1luL+OccAIzNBfEeiZbOo5tmtZRg+JseMiVjuWKzaKHby6bn3KsK+WAVqu8SL
	wQYlCEJWNkevwTNLx2a5KSgYjcwg+nGiKAQWMFgaZr3ELIQiDTkebMJbn12cl93rlCZjKxExRfC
	nPZfDh8rqrPrn9ZxqnqUX3AcGT/xRv6zhABcZCOccYHwKD6+gSn3qiNwKROTOdP9gGovKXHlkkT
	LhvJrZ64T5fM8rOCAQZwxRdp/cYBPcrsvxlSOpDJNTZVVML4zx6oMXm5U0jnNZISSLTV/4EwPwt
	IXvBLnlOFTs8U9/IpHINt7jzxPTrgwndZZyvo24BX7D98D9Abro0pnZYIK1WJzn9p+vzwJnvnZw
	fvPRyQeblRuXuLZQj03hYAAQ2MLPHDwToY1i1JXYDLH5X7yRraUAtWPFzUz/NkfBBjhXDCJGwaE
	mlonvswy5+6JeI7vp8rIMrrfY6sNXYl9JdycfCkbQNu0BoM0qjjXQJZcW33Gq5JBymIUy7Kx2zv
	9QbgqoqnpcrPHVvP1Vczz+q5raGUYLCvW8yn5TjLLdyfnhXhyUvoskZ1VIQ64Es6Nu5y7gJJ0Ra
	NzLfa7y/3X1ZkuFbNhpqXtZngLJ/Z0x9
X-Received: by 2002:a05:600c:5307:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4b6de973c39mr52155845e9.7.1793985667739;
        Fri, 06 Nov 2026 09:21:07 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e168f331sm86675335e9.3.2026.11.06.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:07 -0800 (PST)
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
Subject: [PATCH v6 04/16] printk: Separate code for adding/updating preferred console metadata
Date: Fri,  6 Nov 2026 18:19:40 +0100
Message-ID: <20261106171952.207909-5-pmladek@suse.com>
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

The logic for adding or updating a preferred console is currently
duplicated within __add_preferred_console(), making the code difficult
to follow and prone to consistency issues.

Split the code for adding or updating entries to avoid code duplication.
Make it clear what operations are done only for new entries.

Use this opportunity and replace an int with an unsigned int for
iterating over the preferred_consoles array.

It is a preparation step before adding more consistency checks.
No intended functional changes.

Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 114 ++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 40 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a46c9bd184de..b7543fea865b 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+/* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2543,26 +2544,34 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
 }
 #endif
 
-static void set_user_specified(struct preferred_console *pc, bool user_specified)
-{
-	if (!user_specified)
-		return;
-
-	/*
-	 * @pc console was defined by the user on the command line.
-	 * Do not clear when added twice also by SPCR or the device tree.
-	 */
-	pc->user_specified = true;
-	/* At least one console defined by the user on the command line. */
-	console_set_on_cmdline = 1;
-}
-
-static int __add_preferred_console(const char *name, const short idx,
-				   const char *devname, char *options,
-				   char *brl_options, bool user_specified)
+/** add_or_update_preferred_console - Add or update a given entry in
+ *	the preferred_consoles[] array.
+ *
+ * @i: index of the entry in @preferred_consoles table which should get updated.
+ * @name: The name of the preferred console driver.
+ * @idx: Preferred console index, e.g. port number.
+ * @devname: The name of the preferred physical device.
+ * @options: Options used when setting up the console driver.
+ * @brl_options: Options used when setting up the console driver
+ *	as a braille console.
+ * @user_specified: True if preferred via the kernel command line.
+ *
+ * The function adds or updates an entry in preferred_consoles[] array. Also
+ * it updates some global variables which are used to make the right decisions
+ * in register_console().
+ */
+static int add_or_update_preferred_console(unsigned int i,
+					   const char *name, const short idx,
+					   const char *devname, char *options,
+					   char *brl_options, bool user_specified)
 {
 	struct preferred_console *pc;
-	int i;
+	bool is_new_entry = false;
+
+	if (i >= MAX_PREFERRED_CONSOLES)
+		return -E2BIG;
+
+	pc = &preferred_consoles[i];
 
 	if (!name && !devname)
 		return -EINVAL;
@@ -2576,35 +2585,60 @@ static int __add_preferred_console(const char *name, const short idx,
 	if (name && idx < 0)
 		return -EINVAL;
 
+	if (!pc->name[0] && !pc->devname[0])
+		is_new_entry = true;
+
+	if (is_new_entry) {
+		if (devname)
+			strscpy(pc->devname, devname);
+		if (name)
+			strscpy(pc->name, name);
+		pc->index = idx;
+	}
+
 	/*
-	 *	See if this tty is not yet registered, and
-	 *	if we have a slot free.
+	 * Historically, the preferred options are stored only by the first
+	 * caller who prefers the particular console.
 	 */
+	if (is_new_entry) {
+		pc->options = options;
+		braille_set_options(pc, brl_options);
+	}
+
+	if (!brl_options)
+		preferred_dev_console = i;
+
+	if (user_specified) {
+		/*
+		 * @pc console was defined by the user on the command line.
+		 * Do not clear when added twice also by SPCR or DT.
+		 */
+		pc->user_specified = true;
+		console_set_on_cmdline = 1;
+	}
+
+	return 0;
+}
+
+static int __add_preferred_console(const char *name, const short idx,
+				   const char *devname, char *options,
+				   char *brl_options, bool user_specified)
+{
+	struct preferred_console *pc;
+	unsigned int i;
+
+	/* See if this console is already preferred. */
 	for (i = 0, pc = preferred_consoles;
 	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
 	     i++, pc++) {
-		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
-		    (devname && strcmp(pc->devname, devname) == 0)) {
-			if (!brl_options)
-				preferred_dev_console = i;
-			set_user_specified(pc, user_specified);
-			return 0;
-		}
+		if (name && strcmp(pc->name, name) == 0 && pc->index == idx)
+			break;
+		if (devname && strcmp(pc->devname, devname) == 0)
+			break;
 	}
-	if (i == MAX_PREFERRED_CONSOLES)
-		return -E2BIG;
-	if (!brl_options)
-		preferred_dev_console = i;
-	if (name)
-		strscpy(pc->name, name);
-	if (devname)
-		strscpy(pc->devname, devname);
-	pc->options = options;
-	set_user_specified(pc, user_specified);
-	braille_set_options(pc, brl_options);
 
-	pc->index = idx;
-	return 0;
+	return add_or_update_preferred_console(i, name, idx, devname, options,
+					       brl_options, user_specified);
 }
 
 static int __init console_msg_format_setup(char *str)
-- 
2.56.0

