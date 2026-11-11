Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412134;
	b=g/dJd5YOntiBIMjD2/uLc20F48gs/x2WOHBP1ZJilsF8O69lneAqLrZ6Q9Oqkj9yYgSd
	 uTsK2aaGkB13DPcNVRWgURef+RoUAuR03rilU9JpAM0g+Motl5soDvvVPd7hvyhcLxcNo
	 ti51Pm5R6+TueFEfW7I4Wcd+/nlNwOxL4kR0Fa5ImxhSLJ5iBCTWXr0Q17Za3IADZpu5e
	 L0On+tNo/AxVurfwbTtFHefjel8Io52LuOA0681zXF9+Ukhmaot99rHVEoc+V8JiFGjZa
	 cItrG5XtgCvUMVODn0LNvH5WPrmP8hGSrqdSxmnuf7h11rnnZFQJMFCRpGSeYnK/vzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
	b=fIis+hPGt+KTsfSftO330CWCNZmF9R2G4Abp4+Z/0v5GI3dHaZTNJfOPt+IwzbAAAXb4
	 vv/OFtLvbAC7sfKKMLRbWlRDvNsAmnsrswtr35NdhGt9wJgm7zO+kPI2K6PK7D59iOFy+
	 7nqzNSAPzNqsTmKocWtUfc2knfPrKCI3YZFmb3zoPIu1TG4XlxvFTdcwBv4bu19yBdHiW
	 3RznKvzsk47YGffQdR3ckpym6dIPYzPiYeHbwdkMCmAxr8UHeQVkXY7lYY4pGwxRU5+hI
	 z6Hts947szMMR0ebWUlDA6vozm761bs/gD+p1vgYbMqhSYnaJVLaQ0j8iVAXGD8VJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Y/BD+3bo";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A77606A32D
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A77606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y/BD+3bo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19373225e9.1
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412132; x=1795016932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=Y/BD+3boS0/q8WN374Ksc96oUFVqTz3e+j4kck6WxFdRYDX0wt8K7x9YxfkHJs1Tx9
         NoDx2YFjDe/eLX1E7aoENYA/8xUSTvDJGGKQVL01IUUEj6jZomwiRjm2ShR00reWqPKC
         h538Dq6hGwqfozRVQh2qhpr41Psd3Xb3LH9hs/4kMWmx0/gGtjKBXdA7hQ73hCOG97ZF
         LNS1OVubObHQmc0RzBs+Asq/x2PJA3kc0w2I+cdnLmCNZSZqkCve3f5EBBvrbFVJxjt8
         bGisjKu1Ct/dDgYtk4TPwAIVsj94krdiNPTmOSQFM5gFtXLcTJi3o6LNuNCMINykmPT/
         3Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412132; x=1795016932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=WE4vLHqRxK074T74tWdJoSoxoGLy2bBFD/AHl/CMtUcp48XK+l/jrip0XemQYEmcRV
         y3NlGEkZQrlKg4rfj9qmnyL1uMyPrF05geQRAIhDQDoaG5p8yvM66aLxDrICFVqJmlGv
         qtA4xgGY09uCFGzLHnoveXCQMxCAFUVBBiTjg66DNK1mVpzZye1tzt3n1UyWvVKjES8N
         A9ZVX/gVu4/+F9S9agUey7kef+XYlWkqDLqn0uAd2HNoikvalyq8xxexr1eh+i3aNUge
         BwdJ7baquaagWtBo0ox30M1dvdIsDFmRUhjeXDzGF7VetRcwfGvQRgibvrq2xJZ7JerX
         b+jQ==
X-Forwarded-Encrypted: i=1; AL+hErG6dwq2GLwvKmtrVMmcAv7xUPKBIlkW0XjoQ2d6p9rxCb3ux5StoH6x/sn/OGKa7x66zKBIyqg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8o4K8QYlvGWAmMTIHGpZNXJzcMQZ1sXQMi/XRxbpQYD+8lDUaQ
	jPBN3Uaz/LMfSGmcEBdDboO+spDBnubsvXkDn+W5/cfqr4ktsH5FKLeJKILDCMLLG5g=
X-Gm-Gg: AYBFou1Wl33AYIL14OTK+V7io4v/cBlUM32zvbQG2BGmcWaPy5eP7/YX7Hlgrr5nS7L
	EkU+VnaGEcGRR/ClaK5dr1wbsZLqcPJqYc6aqkjsgopsaqufoZ4NC+v12ci1yGyJsLYX6+TIquM
	F4msCxppsAAJGMFpT9TWkFqrT0WOEUa76qTpStGb1E0yHwWT8hH0oNEl4nSfBTbdUi3t+51KRrx
	YVN6Q3+u3mj5Ujr08Mq1eKMt0ExMyZgI9AgGF13yNdTFo5d1ollju1tpvI6goafxMS+nOGZ08FD
	vihyDbLO5z+KEWICO8GttCFhxNzN1djW2nrh534ZjWYBxMPuRWx1en0efpC/JaYUL/aTGi4ziUO
	v7/zz/5WZqWl9uUhWs8fhiETNdL8rFCleAefMWfbtF3EiybBh5kuMvETzNU4U9XIq20VV3qXNMf
	zB6Tj2wlgo7SzzHRDJfBLTd0Gal6bWs54xak8EZZBpEOjeJUkL4GLjtrF7buuWFuKYBjPw4Xfx+
	VfzyEM2n6atkr21+JECzbb4HUYv6as0+TFNnexgeRXDaAISTvBsWxxblJfdi88o1SE3n9ZU0RCT
	PsxIU8kZmFfzElnKWEEbRZ2s8nYcrn5a
X-Received: by 2002:a05:600c:e551:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4ba59fa5118mr36715345e9.23.1794412132172;
        Wed, 11 Nov 2026 07:48:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm55266415e9.0.2026.11.11.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:48:51 -0800 (PST)
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
Subject: [PATCH v7 02/17] printk: Rename preferred_console to preferred_dev_console
Date: Wed, 11 Nov 2026 16:48:01 +0100
Message-ID: <20261111154816.71103-3-pmladek@suse.com>
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

The preferred_consoles[] array stores information about consoles requested
via the command line, SPCR, Device Tree, or platform-specific code.
Within this array, the 'preferred_console' variable tracks the specific
index that should be associated with /dev/console (typically the last
non-braille console defined).

The current name "preferred_console" is ambiguous and leads to confusion.
It does not clearly communicate why one console is "more preferred" than
others in the array. Furthermore, entries for Braille consoles can exist
within the preferred_consoles[] array, yet they are never associated with
/dev/console and do not receive standard printk() output. Consequently,
the 'preferred_console' index must skip these entries, which is not
immediately obvious from the name.

Rename the variable to 'preferred_dev_console' to explicitly clarify its
role in identifying which entry is linked to /dev/console.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b8d62fec2569..435c1b7148f1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -365,7 +365,7 @@ static int console_locked;
 #define MAX_PREFERRED_CONSOLES 8
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
-static int preferred_console = -1;
+static int preferred_dev_console = -1;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2586,7 +2586,7 @@ static int __add_preferred_console(const char *name, const short idx,
 		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
 		    (devname && strcmp(pc->devname, devname) == 0)) {
 			if (!brl_options)
-				preferred_console = i;
+				preferred_dev_console = i;
 			set_user_specified(pc, user_specified);
 			return 0;
 		}
@@ -2594,7 +2594,7 @@ static int __add_preferred_console(const char *name, const short idx,
 	if (i == MAX_PREFERRED_CONSOLES)
 		return -E2BIG;
 	if (!brl_options)
-		preferred_console = i;
+		preferred_dev_console = i;
 	if (name)
 		strscpy(pc->name, name);
 	if (devname)
@@ -3935,7 +3935,7 @@ static int try_enable_preferred_console(struct console *newcon,
 				return err;
 		}
 		newcon->flags |= CON_ENABLED;
-		if (i == preferred_console)
+		if (i == preferred_dev_console)
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
@@ -4108,7 +4108,7 @@ void register_console(struct console *newcon)
 	 * Note that a console with tty binding will have CON_CONSDEV
 	 * flag set and will be first in the list.
 	 */
-	if (preferred_console < 0) {
+	if (preferred_dev_console < 0) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
 			try_enable_default_console(newcon);
-- 
2.56.0

