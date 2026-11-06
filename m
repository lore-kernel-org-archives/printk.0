Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985797;
	b=BlSxauBSLyMHUao5u/SIPUWbOvuASXGhPY1F+J7pmOsILslZ2yVz7EDSq4mjEDmHetr0
	 z2+0oVNoNF0d1aIm7cUawfxni/epRnpWkKBbUhJlDQfTQ0iILd9eRoBDmCj+aZVKq9ZiB
	 FbKWHMvFiNDaJcAiQJZTwRsoczV43BrDUyDvCBR3M/UpfaUpcc2xfk2qee1jQGYvlk3b6
	 Aakcm+Ep4wHxFFZyBpUfgOqB/RQVQd/O8WV5uKsC/VCNiF9qWeIpv2+vYbH5BsTdsSfJi
	 BT/ikC9kMl1ML8lJZ30dNNy0OTLGhUHE6EBM8mbHoFnrr7pEpI75kQvgO2EOjQC+PDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c5qXSU2oB7uYG0IjKESIyBPZauPIOpMrL+/5vCyIXq8=;
	b=LC471OmXPvBcIFovM1GgcgPihGnWNEZJvrPsYEfayas1dOnT9pHb2CqUHeh9NekmHGOq
	 SEBXeth8vIjlCV3jyhLZLU0NOS1HmF+sZY2/lt+0RUa21rYq8Dc2dVwr5Be5DLYeJGBsY
	 5F1Cz+beJifTtCwFJk8pNS439XjMn/2cRNErcYm5U5Hp7z6k/O7bQxVnY6tfU++d80Hc0
	 GpxrSqSISGOIEtuH+DVFJLTJx3j2OUPEPNbzsVFU3w14Mhn3+vsLnfhS7cNVTCJiIazAJ
	 Zj6hsfO+n+XZqOAMAhQnQDrDSN2J1I+yV8tuf2CTwhWUAjVV2Tvb7k04wz9Y5bkqz2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FEV2kw3T;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF79606A329
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FEV2kw3T
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so7041525e9.3
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985796; x=1794590596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5qXSU2oB7uYG0IjKESIyBPZauPIOpMrL+/5vCyIXq8=;
        b=FEV2kw3Tuz1CHOKx7mkd8xlfHoFvLhLpetDwpccpOeTlDmPmzleX7Lh7m8VDHxxdRj
         3gF26eUab0woq5Huun1VeOybim9dYw4QVyioG+T54iGercjntrKat+2uH/nJkuFNB1E/
         OkQ6nXsyFpndecGmPV6eKgSXbxzW5Ml7Hbc4iu/NlQ12cMFa0dzhaHV0SQBpdLOQQ9vA
         w2kmqCVV9DAL0QkEVKutG6AzsZ/tWpDJHDZlRK1ubpD76aQqM0FxdFFejg4f5MtXxbVX
         hZv6KZSDdUIAHmdHnQ+tU+BEXPGcjeRYYLTM5V8//JCzmZ3nJl7ZuQzubQts508yPdFV
         PaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985796; x=1794590596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5qXSU2oB7uYG0IjKESIyBPZauPIOpMrL+/5vCyIXq8=;
        b=ECoNFWwZ+NyWTk6w+ZVnteTuL4jaGMl0S64Spx507lhoQAa8boCtiOKkx8LOz8VLrZ
         R05hfSimhOiqweO9VsgN7WLU3Nb+fwd/9C1St1vetMgObBBIMEBf8Lkep2UQcSpxqmk1
         KaW4+Psw9qb9M0hJ087zbM7nvNBMtA/3tYNp/rxJb3JhfEVm2UZdAykBsJ+wh54kc2T3
         keL5fooCWve9QjHbfiVbF70/08oZzkvaEyf/xRe7yMvmgAL9PQbILe/tOsdWD1eJdbsd
         uFS8+IlzjcJH6jVfDOngFEidzlw/+e6wfYHla9eKnu3zHGoSUvHoaXRyNo3wASVPd+I1
         CHUA==
X-Forwarded-Encrypted: i=1; AKwUvBwCFP0NBQiDnyUBymtxGyz6acPe/UOhKk5Bg2aODBeO+PDbpcf1+pAE7ZsVvPszOEVLcAkiijA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HDAfJM0FLtyu3eO5IM1orxzEzVCf1pMGnzsilL3GfCJGareJU
	mNnuRRJrd4TzWbFbRFFTTYHxxxjr4F5FSJCjHlTr3N5m1/tPtYY3goPFKxL7oVbOv1IoeDYpCKf
	g4WrsKyg=
X-Gm-Gg: AYBFou2SORKjYimJC12w/A1+9P8uaMZODa4tfYN9/OQWYeiwM6Ndi9nPOhCywBIPVqa
	CGSEMiY5ivVcpaoYxT24t8R7jBQsTO4CWZNCCr9cdpFJ88Z/t1FDMNVjb/9i7xDzaaOWxIkXrAP
	vNlKA9/fW70f8ltbeCg2yaQWMEbKU3V0PsZ/1ZU8qIs/hIxTzd+C1pUqKni+gdOEuCSEwqIhNuC
	deAxgUdnV9jBxbcafqMZ0mHEbBfeIueYZ0FlT/F2VbqGQIguSqxgkRojS9axo/B7bqDUpkcDlcq
	s+i+tyUQt0cz3k56oQM7pIfDoUFhRe2DI3G8s1twn2tWwPmZTQbJEUgpt8c99g4ccEtaIkr8LbA
	Yvdi0DXdVDNZ88bYKkSnLBSdYjg07cw1pNdhdWwFLv9PsWtUzjrWZO4K8/hbnDVvhTsD21WwRqf
	g7YqjOymhUIxjGT8WTwHBZIVxer6dffFK6fzQz1Ux3ROGim3C9Q+EkB4KxdoMIrm5phPjDY1mO2
	NazSyNX6PJp816BZBkWL8QRYuMjbvDwJZXa8P9M4o95ETKadv8/O3VEopU1gFuu75J+Nu2xzI4b
	+ZAsq0gmEDj+f/JxIFCq7GoN9czgjl5R
X-Received: by 2002:a05:600c:4583:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4b6df4f2484mr55519915e9.15.1793985796065;
        Fri, 06 Nov 2026 09:23:16 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm87009245e9.15.2026.11.06.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:23:15 -0800 (PST)
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
Subject: [PATCH v6 15/16] printk: Modify try_enable_default_console() to return error/success
Date: Fri,  6 Nov 2026 18:19:51 +0100
Message-ID: <20261106171952.207909-16-pmladek@suse.com>
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

Currently, try_enable_default_console() has a void return type, and
its potential failures (specifically when console_call_setup() fails)
are ignored by its caller, try_enable_console().

Modify try_enable_default_console() to return error/success, and update
try_enable_console() to capture and propagate this error.

With this change, try_enable_console() will no longer return success
for a pre-enabled console if try_enable_default_console() failed (such
as when newcon->setup() fails). While this might change existing behavior,
it is the correct approach to ensure setup errors are not silently ignored
or treated as successful registrations simply because the console was
marked pre-enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5ec34dc2d168..cbbb9aed3e61 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4072,18 +4072,23 @@ static int try_enable_braille_console(struct console *newcon)
 }
 
 /* Try to enable the console unconditionally */
-static void try_enable_default_console(struct console *newcon)
+static int try_enable_default_console(struct console *newcon)
 {
+	int err;
+
 	if (newcon->index < 0)
 		newcon->index = 0;
 
-	if (console_call_setup(newcon, NULL) != 0)
-		return;
+	err = console_call_setup(newcon, NULL);
+	if (err)
+		return err;
 
 	newcon->flags |= CON_ENABLED;
 
 	if (newcon->device)
 		newcon->flags |= CON_CONSDEV;
+
+	return 0;
 }
 
 #define console_first()				\
@@ -4126,7 +4131,9 @@ static int try_enable_console(struct console *newcon)
 	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
+			err = try_enable_default_console(newcon);
+			if (err != -ENOENT)
+				return err;
 		}
 	}
 
-- 
2.56.0

