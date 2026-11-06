Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985645;
	b=gSw0Z5RCXpTfpXgEj3tTVW8SCeYN3mZjePRtvHCUXD8EwpVJqigFpVNM8xxkhdBzm1xG
	 7vJORy6URwI9fnCLMqklOPHVGFH1tMnUJ0S3not4SFhvMX2GJVH0tzLHXXGAWp/daas4c
	 G+WFgcnBlpJl32+0h7y5HKlKmxMxwTajSKfwyT//kcOcIFrLDGF2525vVNPFtyLKoT3Oh
	 soT44jTmVdjpTlmrMF5h1XWgEspleJHKefgIE1aKIo7IH3Q7NIQug177FZN+eAxrc11Sf
	 1GQcCY9OmTARkP8UYCt77ETXwSgs2VMQFxK9VML+sQEHhXsXzD0p27WQhYo0pGqgYXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
	b=ZI1CPqx5mOUQ6S0mcgTYRb281SWWN95CkKv6AlX5iZL1/z/QauwDSMraEQM2x+Ewcg+W
	 ajdmr2D900a/SrTTA0y5rIxWg/dWU7z7xBiWj2cFmB7u1u182ICx/EtFss67ofUfCxicy
	 5PwxBg4tLEt6l1VEep9jOd/JuPCFdEMQt0rW6uLIqTzRoOMqTSX/MNvArFCBCs0SjOEuA
	 Dg8F8zV/p/QFvF/LQc4iSpHrZIolP7m4MPHqO2dg8EaeLYXY8DmBqWS0oV9YMGPUSTHii
	 PRC5M9VF26tgu91tjFx5I1FBWF8vtf8Lrd9GeL7Kxa2jJEbPIMHE/7oV1UPodNRdAdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uykkn3yX;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F440606A32C
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F440606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uykkn3yX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11766975e9.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985643; x=1794590443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=Uykkn3yX0m4F2Mhu2VMvdVDcxb3FUE+pwP3hf1kPPBGm7oP8pP75UBariPvHvkFwMI
         taLakUjF4CdufOFVoMvrJX/+rECexcNOq2Lb4zM4pLXRow1KuMmc7KGZXnVqz2vJxpdT
         VROQzEcA/or0b8TkTipi3cAy3wO2uGl3xFkSDnNMsSrZFgLJ+AaxDNJjj8cpJEyGQyEa
         ESjd7zPLVogWJ3dXTwYxVdEco0mXfpl7vm5z2mBf3eUtxQeGX7ZGiDmzJV5r+Enk2bBx
         gtQpsIDhdAhBzcQkH5YR/DRt9T8UFfgoX6P9XWsyWP2NKGnV5ybs3WnDFzFaO2gkY/3c
         Tutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985643; x=1794590443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHUfJ6dqmb8muzXfUhszYtRCrN8OOAsy6Pak1yYwLow=;
        b=AsHFDan0+J5e/sg8h8+hFwO0mDKNSbfse/cMjtP63cKhYxaC3qPaUT/7GoCrfW4cJa
         dub27KfuF5uCWbz2iCFYOdkTAljbFAau86ng5+6CLk+qw2LW2L+69e5NUkyNTzHsGAFX
         Z2JqDhaqYiRq6YIA1n7XAFshL6DKTgScrWvCAYEB6BwkbNe+YSjQVwEQFMsb5sXtkCxb
         /UGJO74i5LoLAP6YyPFwJUpBB64krDbURiPyKuuseKGAoQ5vaW7EPT6iR5IXGbwwdRld
         3nfVxQSqfFAqOLWbVCXzQ7k7fhVrBB5K53HY4qR6k1UBnp8NsMau6+voz4TMq7t5ug0u
         WVtA==
X-Forwarded-Encrypted: i=1; AKwUvBwP6VvVWCE4/XKdBn8OoO4frUqFeQAvgUYwg4PGqfVu7+UOq89FieIGDN3mkjjriQ4jwXb2bqQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9x9pxM/C8EEGTMekaHd4YF3dCbYEeHOyw7lhp+yehrW8jdP8nf
	TcfW/4x/egBcbZUWLv8FVDXHttx0EB38bKNZNKywXs0Tkh2MFNe2AB+4yyMWigtTNJg=
X-Gm-Gg: AYBFou0RL1XrXFmf1S+8p7kyssB0U0QGYfrIhAkyyst0D00S9fNhexFrzcekV544sXb
	Ljbek4RKMNsiTrXy5+m+opXEsEvF1iVucxX7sgrV2TS6sQGFJ6uPC1IgwsEz/LrVah61KmTnRa2
	CHpTfEIt9EHvGX50w6OtUECfnZw+fV8Vp1+7njb+ooDaYfV322UOVikWfEnu/lxGM6/xuJJMOpG
	lBQOKegZydfhH5VhOkMVpceod8bLs8WrSTIizRgJqVR+8Gtgje39i9VitivYIaKboHg+C/5oLhB
	pOBtTGzR9V/SwW6R1mlQDDUi1ejsdYZY+6MX85btdPFry099hzKz+NyPJoIiKlRmDaa32g/vKH6
	KCiSqeX3+/d8MF/Uym31rZKEiJFyCq53m//0mc33EEyxfVB+ESE8A/1dtupnWX5EeekA6978uaR
	nIL2/SPl9F2srWEb3HVyoDbu3nPjfmmlY4uIiE7we6nhGbC/Hl+8JbFQBw2/kE8AN6KJKAjwC+c
	2lwcxIqH0j7vDfi3bWprrKEnKzMn/+ZO3sC3tbvhNHHqiV0Wc0heumBj3EemNtsHKgsiSok8aRO
	Cv7CVVI05uiMjnNFJReYePliMVdBhxU=
X-Received: by 2002:a05:600c:19c6:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b6e091ed94mr52650985e9.17.1793985643472;
        Fri, 06 Nov 2026 09:20:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b573366ea6sm159116615e9.14.2026.11.06.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:43 -0800 (PST)
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
Subject: [PATCH v6 02/16] printk: Rename preferred_console to preferred_dev_console
Date: Fri,  6 Nov 2026 18:19:38 +0100
Message-ID: <20261106171952.207909-3-pmladek@suse.com>
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

