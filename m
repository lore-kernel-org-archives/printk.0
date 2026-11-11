Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412157;
	b=2nLw0O+4z69g7j9h6TSELdSxXXfAB5nPBjQbaiyKhFar46nXHAkx0I/Ei5Oqs8cECa8h
	 Xnccc8ch7dANxoLFFFIxtE87QdkoyTowkT8U1SEIgHFFQ3hVP4jBPtUaROSCRsaCfDxbK
	 XzwvYPJtLlBqV9s16ajpeiVLZqdyJbiycCUbElB7oCpKCNyNBzc6OSmQKT6uVw5xLIAXu
	 hWPKuMxJCx5SL3kWTWoqNoa0nIeStI6UKc3QZykth+E+sIm/b+tbFhD7lnuvHuOtyROAv
	 6F527u5owVL+kkcck/iNR7wAtlcEzyKa+2MdKQ3b0wUEvBif+Ew+Akkkt28Q8ed2+Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y4S3w90quI9shg+G5r+d7cVg5MriRy6W+RybDeZ+ZJo=;
	b=eQVPqfEToGMZP81pTgVvSdtBxsW9m6NDT+xXAtH3AZdJUwCDPthtQHA4YlpGbA7t2nY+
	 ECvtRfxzzs7K3t4DLHgzdyo6lpbx3mGj9zt4G48O2IlavUzVI0Hx+GMFL+Tj2b/51Kg0l
	 Cr7j6blbcsgI6ZluKvgpRmk5NeQPEElMHjz0RozftMX/VnWLSrgEq4+kwO3OnUyCXOE70
	 Ff4ZoETf14eoIR/ydt9HTiNFTHovEGXae7lvfxrNwI5auT56rqDocMKbU7qToI83R3iTd
	 002FFVBb9VFkBl7oRWo3KYMKCTRMcCFb3Ajg157LSNSgVXPa8kCimdu8tXtkH8HBVxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PtFmrW1G;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED20606A88D
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED20606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PtFmrW1G
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2228396f8f.3
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412156; x=1795016956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4S3w90quI9shg+G5r+d7cVg5MriRy6W+RybDeZ+ZJo=;
        b=PtFmrW1GDA0YFmBOGZXjYf7IOxkJbGX69KYsYnNGzuqDP/ia2F+25PweJ60BJfOUyR
         tyilCyUc/ri+RiDxWw8r5/OaIT0Jxly7G6Iydn7qSYuJSnXs5gtPyBSo5JJMqjAdekYF
         ScCU6h5nvtVVnst5EJeg5Mn1HsHOaj4DmUCNo5HI38DCrmD0fbxw+7h63ExmIgmPw5uo
         EL70Yz0hqrqOKOJKw7fzgwVGkpacpHtAIbNosByHsSHTCQgeD3YdymusN8J13kfD4m8Z
         C6MaMqXtFdQOMXZb1yZGFa0g1lSk93dTWKJK8vm3qqJeiKzTDAnSkwN6TQZ+flB1sydy
         27xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412156; x=1795016956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4S3w90quI9shg+G5r+d7cVg5MriRy6W+RybDeZ+ZJo=;
        b=ZBstN9avf1PMSKBVWGtD7jgDd+kgOLRoe+bDKo1VE+jaZOUk5S/WH7uPICDSZgAoxx
         td6XjL2DrQxjeWA4ZDTH7Oe+52X8hVygzu26HnmUJkZjKEnt2Xy1EGosw0cuZkYPB/gJ
         Ey3FoJKVozteH31Dl4zjuOb+CME2zSnj//JOy5iT0+NMTXxg1YBpR/IXZXHNkjozawl/
         WPnIWo14OZfsS+24Veo9RJuR4t5l0jORvTRdH1UAE+0SWELqihPUsVmpiAnJJIEzmfPQ
         nRB9roluqahB0oFGObIBSjkohXBlYTZO/vwVtmI7AK67p8F/onTGVNAP5cYqrRDbZ1zu
         xqUQ==
X-Forwarded-Encrypted: i=1; AL+hErGNq1V35WF6CyumZksijVw7Yrj3h6OFrQVnwq+aP29BIgZQul4HJEsYs657IxPmI4iaEl0eZPM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZbRP7Xe3dyVOZbjkvmEB1Fup1EF5ySukMfWl4CAlUIK4FSqht
	0s+jrXPb6gUUFnYrk2nV1FOoqd+N/kb+GGWaV+Crq+aNmoN/owfvEWmmh9jur4VV8gA=
X-Gm-Gg: AYBFou0C/gl7KqUgtWiH+LzSKY1IRZAaVvwTRuMF4BtCv5T9pD+svJihcvwuNVcnZSA
	OB6QEl7wi7LREPp9G56ijyS4JdFtjSxLGfF66z2cw2l807D+6IK5W0JfUww6J16esmY8cbER9CI
	g+1XwpXhIFAol7PMRFWCgxHgjAlnnS4u8x8upWrd1ZFG+9cslGHc04zmR9RUoouIf1YvW7qgIxp
	xSyZXsg2lVe5hvcvdV1cnPwzpY6WRyALdU/itIhRzBrw7r1Ptl0htDasWwkgnxtWZ6lgPUJkkr0
	BonIICBzXyFPg32ZYqS04P0k2uZ45AcntMx8ufc3M2oExSUzGCFxVY1AYteNbBjf+xp2nYxsxIz
	XolkJAzRgsC8/ZRNXCyZXkodGP60uAUeHL9n40NM1/rQaohFXYh9WuAG1uFTyggMlcSXNIFjs6s
	UWUjXk8yehDmt2LWB30XaooHPumz7K0vqp9WWrDW4lXQQcUOW8CObzHrwj3nV/2epA6veR8wFCi
	vNAO5ud4BmWFEgV778Kd1J/NkrdSWAU2nTcSRnIEELzNJ0wwzrkZk/w84lTAzoT74Oas/W7uDy1
	HY/SBzp79ekmEIka3RF8JCRCOgVolLFZgHGwTQNso8J5qfwoihQZ
X-Received: by 2002:a5d:64e4:0:b0:491:96fc:9f0 with SMTP id ffacd0b85a97d-499c7552529mr5381970f8f.15.1794412155585;
        Wed, 11 Nov 2026 07:49:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f6bacsm11898729f8f.35.2026.11.11.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:14 -0800 (PST)
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
Subject: [PATCH v7 04/17] printk: Separate code for adding/updating preferred console metadata
Date: Wed, 11 Nov 2026 16:48:03 +0100
Message-ID: <20261111154816.71103-5-pmladek@suse.com>
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
index a46c9bd184de..898e060a26a7 100644
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
+/**
+ * add_or_update_preferred_console - Add or update a given entry in
+ *	the preferred_consoles[] array.
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
+		if (name)
+			strscpy(pc->name, name);
+		if (devname)
+			strscpy(pc->devname, devname);
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

