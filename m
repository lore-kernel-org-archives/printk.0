Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985716;
	b=nsGY7CuRPg3Nsw9iTDHj9X/pxOhPonLKxqf5c7Vs1U8s07OwtHYzc2mPy4lTPxju4f1g
	 fuJz5xu/oTHm92gYV0XD4RlnWofVeGy8377SKMtPYhWOvXdHawT4ghpfzKkjSVtIMRCz6
	 SR0Q7e5q/x524E44BWuotEat2a1IoGQIZ574U97iHwIQP4DPsbQWm71gjcBJsvnqfV6Ob
	 ekhD0E284mYKkqe/4OKsrg9k3SFfacMptTGQst3EbWl9Av6pxLFde9/xsyyRa3iXjm7fp
	 a5Xy+b+P0MAHLmI0pLzQU9m1r1o4nYdO+V7JAznGsoLH42FwNgYd+S4Vnwxu8qqptQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3B/XdCDqxYihkjutrAtk9GxRkkYw7MTTo/yR+JY2t+U=;
	b=5cT6yn5j4YSoVCzkKbkQYMi1gjdiXa7vqdnHcLFq4UVJrdmxJG+HxNfKXJ8U9JdfhbcO
	 ML7K3ta6n4y7wtowjE7fj/qMdOB2MTZnIds6/Dh1KkSpNPuejQqxPLpMLM7B/xp+cxrqk
	 STDDFwRsmQSxtFGP0YHrHwnzb6EiXJXt/2iz//sYVzb9jA8Kcurcp779udqo/AThIq0lQ
	 XrSaHcjAJsirFMpUjqhVvCom5asODjGXBfB4CQRspFqL1vfeE8AsmQg7l8PeJ9SdKCJ4U
	 lrNumk4LYOEC0TgIt83+FofyfogJwqaQ3ACdzcNQlSgZjUDsu8YwjnmzzYOv45jn/vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JjPe9v3w;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE9606A334
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09EE9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JjPe9v3w
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso5802215e9.0
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985714; x=1794590514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B/XdCDqxYihkjutrAtk9GxRkkYw7MTTo/yR+JY2t+U=;
        b=JjPe9v3wCQeG2pUR9k3EH4bzUMFpvVggO2gb5WYQDNGEYlQSc19tIVh/reui7/uLtN
         JIkbLDIED2sIyHF57K9I8H/pZz9Z1bOidgiw6LH6RPcAec+eiBdrt/FUJcZ8EgwaZVM5
         KOP30Z1BxTAEOLLZKhkSgeHnex9xOkGwlHuehoOOtMFjVVM9AQ5LvjYt0L+b5IuT1raT
         kS4aj3BwO5uTcuaAwExtjz9Ew8c8m4NTqLu/gH1FA3RQU21+B1RQn6WknNz4tjO4TYlq
         XBPzEFWjnqgr648yyluq3Kkm7gcBP2YnsD7uw+HTtD7XWdvbFQi0vIoPcIApIDdF58eW
         ANMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985714; x=1794590514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3B/XdCDqxYihkjutrAtk9GxRkkYw7MTTo/yR+JY2t+U=;
        b=faotKGEcY6N6k9PgVsikMNqeeNuDbC19wQfhehoHAoZj9dr1sBmkNnptANsO43raNW
         s8cZLSvQQp7sieCVkwqIN83dLD7srpVEeVbkugEsrRH8vitr7/Ut5VA9JHoUQ2n+UQ+N
         sXyjLwK3T6CFt+C0lMPIEsG+b+SWp69otClMZSJ9eOdlmn4nrJu4la6RHWWKUaqWCMkd
         f8EFX6joOEwMikwTDe3MfCrGmXu57ernHG9Um7cBQqt2QTUSPkjZIS0lhCO1jYLr4XGr
         0RPBB0RME4fIiauNJid0Ma1ii3Wh4bO5IGpxQ2B5n18pvQALP8juP0mTFeJvNEXbWUcZ
         a8Rg==
X-Forwarded-Encrypted: i=1; AKwUvBylpBp2mlCbIYupSKKg41DluY27PhgViyVy3I8bv+cy53IBXK4kMJueWzO9oWD4bCXsw113UIw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8f2gwper25x7HDMJZUys/S3z8AkIJAnkgRSVW6r6Pd5LB/RWCq
	3kcJ12cEtXIGPb3Ueiy27HMVY0TtF2vMH1o1DfHoyj1kHkD3uAbhsyhiLExVwgsaUgU=
X-Gm-Gg: AYBFou2nMOuLnszBeFOdF8XH4s4DVeB3jdcvx24OiDshvgeZ26Kwy3jYmoBaNnwxqpM
	/9QHQO9/JaeuOL8GfGwQ6BrhMrwp2LCzMdBxMlyCxVxlbwUb9XDnyZscIDoF5vQYkJU8RNmwjuc
	MuXKgCOyOsnj9W+KNB3ryE5nAX5fsY/hJxWXny/DJzUS8tE94ipWclccoDdDPpjDgxpbr5f/Mya
	y0wqsE4+xXwecMoD7Ju/yZ7GBr/oL0qhScmVmyVriVuqPHAkYvMGNpccqgQoY/NHLLOfSkN+Znb
	rqmXw+zOQbYTy5Osbjn1PbEXyoxADzduxEyyYVI7P40RZo5/5affBJmvpO+9JQRi47NYXbfK/Lm
	lW3it5dl8R+uZgVY9yaz43acvqHV8D6ml12Fuibj1JUXjG5PUj1Ot5y6sidIF3tK2gWkQ9NLHXt
	2P4mKzOqRpv+BTPFhA+m3I4ilVK138quUzVvp0jrLf++RaHPO0yqO2siNbD2A8p5iMS4sF+4rxg
	qHJsQ9z7a7PTvNLbgzk27mKg5zsXMezPkpfZLUkYyPX9zgTgclsSqCeCA3HPEbAPA9gsCIoVdiZ
	/SNP4gLrRHU6msTfPkwlmKPJ8098YJw=
X-Received: by 2002:a05:600c:1d1d:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4b6df4f28bdmr54940675e9.16.1793985714465;
        Fri, 06 Nov 2026 09:21:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm146293965e9.5.2026.11.06.09.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:54 -0800 (PST)
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
Subject: [PATCH v6 08/16] printk: Ensure consistent name and devname when updating preferred console
Date: Fri,  6 Nov 2026 18:19:44 +0100
Message-ID: <20261106171952.207909-9-pmladek@suse.com>
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

Make sure that add_or_update_preferred_console() updates the right entry.
It is a paranoid check which prevents a potential misuse of the API in
the future.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2c205c454321..60923b997e4f 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
  *
+ *   3. Only matching entries can be updated.
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
@@ -2589,10 +2591,7 @@ static int add_or_update_preferred_console(unsigned int i,
 		return -EINVAL;
 	}
 
-	if (!pc->name[0] && !pc->devname[0])
-		is_new_entry = true;
-
-	if (is_new_entry && devname) {
+	if (devname) {
 		/*
 		 * A valid console name and index will get assigned when
 		 * a matching device gets registered.
@@ -2608,11 +2607,18 @@ static int add_or_update_preferred_console(unsigned int i,
 			return -EINVAL;
 		}
 
-		strscpy(pc->devname, devname);
-		pc->index = idx;
+		if (!pc->devname[0]) {
+			is_new_entry = true;
+			strscpy(pc->devname, devname);
+			pc->index = idx;
+		} else if (strcmp(pc->devname, devname) != 0) {
+			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
+			       pc->devname, devname);
+			return -EINVAL;
+		}
 	}
 
-	if (is_new_entry && name) {
+	if (name) {
 		/* A console name must be defined with a valid index. */
 		if (idx < 0) {
 			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
@@ -2620,8 +2626,15 @@ static int add_or_update_preferred_console(unsigned int i,
 			return -EINVAL;
 		}
 
-		strscpy(pc->name, name);
-		pc->index = idx;
+		if (!pc->name[0]) {
+			is_new_entry = true;
+			strscpy(pc->name, name);
+			pc->index = idx;
+		} else if (strcmp(pc->name, name) != 0 || pc->index != idx) {
+			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
+			       pc->name, pc->index, name, idx);
+			return -EINVAL;
+		}
 	}
 
 	/*
-- 
2.56.0

