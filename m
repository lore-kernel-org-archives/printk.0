Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412194;
	b=xDCyACKnBc2d+ASDck7pAVchUpOcKHoPUoOSzDVoe3WiJqXMgPalHn65GfDf8yIMccgB
	 BZpC/0LAYa4Y47vKtX5uqVjb0yOt9w2bF43v6sslISL94LQJn1gUXg0h8EQirLsr0+mhW
	 zyqpHLvgzawXWtdGoeM65QhmETzoXFBdZhuNG9Hr6JnywKayPGv2gZEhT/PP0Kg6n7f+X
	 LlESaJdY9gjhmSsRsofR8iAI8IJn8U3SCunuD5mbs57JrCCR56hR7e6zz6zOGKMlXN1fU
	 VBD6N76Ee0NI1pkttezNQTO5jChNqKAIEFhK39d0jcZOnTxoWK9o50lyYeKy0vuVzWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Aig7S1zIbGsC+gFokDGEF4ZLsKvWTk7KGyKPmaUhUqM=;
	b=1OddJzHMj7qql43uMQ/kYiwPd6J3iD03seROcoELW/UASCGc/AKppyMTADwChWcuxcOl
	 K9y4b69CqEL7+bLylAqgdE9xaYkxg4oHeLivflHj+vQHZuyQL8rLccBrEBMmWpYehR6XS
	 QUbLL3sx/FTtgADLrirooTevMIvhV1X6G9SMVaNsynnNkwxTJFOyvoqYPhDhVbns1R/L1
	 gxyVYMg18obwX9dy/sjJ86phTyZyy3cV9nWj4xTaQwsc3iTs33gO8SCUVgME/rKnSqRHA
	 VanF3xXXJHaO81W775Wm4ChFRnd9KQk6Vr/8llqjrIl+5T1CRb1B2z7J8Z7x1ADfvkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RUQY3xE0;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171E606A887
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9171E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RUQY3xE0
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1922941f8f.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412192; x=1795016992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aig7S1zIbGsC+gFokDGEF4ZLsKvWTk7KGyKPmaUhUqM=;
        b=RUQY3xE0FtQqio1sCKx74w/xWKADJ/iBp8Seea02gLkEfZJ+7dv/qGKVMiHSPc9HBh
         vigesKgAZ71sOMVAfKEmePpir9quXnWeMyN9D3smuvIhx5fCQcaJjdOlJ4aB3KyAB/dm
         ohpzaxIW46baQrSJJaqfdzNnEyY5eN1GkDor7ruYTFM7x7WxYmttcP/q8RpCEH+IjF4h
         8VaPV6zRashqFe409H0EB6X56b/piP/N28kf2ewp1uKN6iPoZgYG2vBdlts0ysq3YXcD
         SHea9r+vj6a84/whG7WGZVyrJCeeajSWeOg5xT/V6foBexLVaLLc/Y25IePf47y31D2x
         Zx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412192; x=1795016992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aig7S1zIbGsC+gFokDGEF4ZLsKvWTk7KGyKPmaUhUqM=;
        b=wxcL4Dbh95k9ymDAztfvXBre3fzODljBgAlLFmt1zNTb2dg8izKc9eM+YYn3Z+Vxe2
         7bAPrn1U/313arxdAaktmce6urar7FL1M6Wd/F9tV94YPVOSY9uvxEgx9+kU3VJRtKAh
         Iise+SHCKIG1IvrjhEZZ7QQpK6rR2dar/ZZtVEyK+QV+xa9RGtQZpLXf5K12YNyj5AS9
         ekX/PZmvUCXNmiQxw4cZDDlMkzAj2kNU74j4ExZoeChflZ1y6WNgIKN9YLUWnbR1348b
         2HISUNFryTBbBBDbQGiftL/1q4bH0C3GToKnlIgoWXRrd7LY95rNBfr+uwt4GTEp4IIS
         s7/Q==
X-Forwarded-Encrypted: i=1; AL+hErEAc/EvNSB00N1053hNFI/9yvWMxK4byYDz1FY81MQWTVufihLuKaTy7zwbQVbXNC7ip15S1eE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9aFzNuibu0sL/fAwPQblfKWkmSOKjVbQOhIBr3kyY/RgVL+6m0
	O1rdPUngJP0PX4OpR6NkbimqSoRs5GdDqRmfIQ9hqIGjxFh8kSjuBVGC+9FxRgL02sQ=
X-Gm-Gg: AYBFou2yPC3ZWVibHCEBDv4F+FY+1a6lD1L9nYqxK1Lkqc/IFohZOTYMzS1nQcLo/B5
	4TTLjQvXql133vzNE0fNbdQ8lmZKH6uvSbuBRzFC5Olpx/yzT4OV19LE4fA1/PAND7JlHCGFq6F
	Kje/zCr2ReeY2yvnJEUXM59zGXZZdKCZOFn2mFEKFV969ljYQv6dPjD87JKrW27LLQ4umg14v7M
	Fi9GZXsRmHjGqjPLQTQwUeIGv9r+NVhHMD8tSKOzNth6dSZoGnhvMu/IPZB4+WBXhNPu8Q6r8rt
	KVDG1tqobfJEc0wmjg2LlS0X4IyJjOcN4PeK5qUZXqE5FgZPLlwC2f8t8CJ/74ME9hyndFBdJVM
	ED2jc/S7lBw/rSm4iluhzxpPCJt8xFsEjDK6MaFkdOshhPPOPSwl3ntmY6wCZUjS4PkY14uAnC9
	YXgKnDn2bkm7tLFxEf6Tg5pEbJ75Et4U63/hmP7sx8478932MNgJ229/AM/zcrSWx+jLQ9d10Ai
	CSO3QDQNTYTj2AZAMKhNkin2xndee5k3wHeuakyGwz52Sz13esqIJ1F5gHBNFbHudRhstX3SrS/
	j4iwPRWS7D2iAJwQ5jfS+TD5Sw+NiEQ=
X-Received: by 2002:a05:6000:2612:b0:490:2bd4:5c42 with SMTP id ffacd0b85a97d-499c86a110cmr4323289f8f.44.1794412191498;
        Wed, 11 Nov 2026 07:49:51 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm12358252f8f.51.2026.11.11.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:50 -0800 (PST)
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
Subject: [PATCH v7 07/17] printk: Check that index is not defined when a console is preferred via devname
Date: Wed, 11 Nov 2026 16:48:06 +0100
Message-ID: <20261111154816.71103-8-pmladek@suse.com>
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

The current code makes sure that a valid index is defined when a console
is preferred via a name.

On the contrary, the index must not be defined when the console is
defined via a devname. The index will be defined later when the device
matches and gets registered.

Enforce the 2nd rule. Make the checks symmetric in the code.
Do not ignore the errors quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b139314eda70..a76f37c1b431 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2562,7 +2562,7 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   1. Do not accept empty @name or @devname.
  *
- *   2. Either @name OR @devname are allowed. [*]
+ *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
  *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
@@ -2595,23 +2595,33 @@ static int add_or_update_preferred_console(unsigned int i,
 		return -EINVAL;
 	}
 
-	/*
-	 * We use a signed short index for struct console for device drivers to
-	 * indicate a not yet assigned index or port. However, a negative index
-	 * value is not valid when the console name and index are defined on
-	 * the command line.
-	 */
-	if (name && idx < 0)
-		return -EINVAL;
-
 	if (!pc->name[0] && !pc->devname[0])
 		is_new_entry = true;
 
 	if (is_new_entry) {
-		if (name)
+		if (name) {
+			/* A console name must be defined with a valid index. */
+			if (idx < 0) {
+				pr_err("Adding a preferred console with an invalid index: %s, %d\n",
+				       name, idx);
+				return -EINVAL;
+			}
 			strscpy(pc->name, name);
-		if (devname)
+		}
+
+		if (devname) {
+			/*
+			 * A valid console name and index will get assigned when
+			 * a matching device gets registered.
+			 */
+			if (idx >= 0) {
+				pr_err("Adding a preferred console devname with a hard-coded index: %s, %d\n",
+				       devname, idx);
+				return -EINVAL;
+			}
 			strscpy(pc->devname, devname);
+		}
+
 		pc->index = idx;
 	}
 
-- 
2.56.0

