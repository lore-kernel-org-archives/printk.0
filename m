Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412181;
	b=EnQlFCtYKgb4Js8E9R/zGfrnCqBrbw7NHrk3C46OPMXivDVgZhwyKorYdEcx6DTYVeVU
	 Ar8BDAMNMJZB/DfcKdgx3OznKqP0TN9WXjmC9iC7ltL+iV4P1RnEeGNu0W3CPxRGItMyQ
	 3m6AZpeIsyTKR0LXDD1jK/j8rsHGbL8pxdO3gnZurKsd1TYTHZPPjN12LVw7XGqEEnN2F
	 QH+M0W+g/mgyEOPr9UPZGK9IB89RJEeW9YkSurW2T8fv0oUDum+CJPOVLbi7WbehkMH4g
	 BHT1rMQ7C2U7xNRma4ZhVEj8tZ9SVVnBLlXJrRohSihF7ueIYKw1Bz4NYNPv9ursVFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zY/MYfFEjw2YFz6ONFSXVTOnks+S+fKlmAWumtYd/lg=;
	b=ChFmBbsQEmf2a4+m3coisdbgdngbwffjnRDwFWraHvxO+rIdBmRvnWg3M4TeXtnKg0CZ
	 bldpXplBsWNx61087+6zt3mehm9uDE5NJdbV/nHHv7tQroI0wgCdAWP2Emqkuw0MVJjRK
	 aCMx//bk8fDrimf+IJTScs5n7w1I1GVcsgNPtwHsIsyhwgL0BGFo+oPsnQA7POBKh4WEu
	 4X92OdMOov+5Kf6d/bvICW754joapsffiZA4faOXILxsnSUPvaGfglbonVKj2KmCal7mM
	 KAEr74EJ4QizlFFg0NPiaW7zcAUDEaq3VaeW2rdDFZQaMbKdd0RqY2RfnoxtXuyndFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJVWARTB;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95AA606A32D
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95AA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJVWARTB
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49134c8509fso2724512f8f.1
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412179; x=1795016979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY/MYfFEjw2YFz6ONFSXVTOnks+S+fKlmAWumtYd/lg=;
        b=CJVWARTBLETugiFEJw2aKXJaRMnOSoActTvL57X3M2JAor34i0/72sTG2a422P+otc
         sVK28nX1ZnAYUIQcEiGE8Y7QS1mSPIRYU3LEyEhz9yEghSyXLZ2XHPwi0TkQp2WbRiuD
         023YaMcpzgzTaY1gTLS4gDnDh83yu6DIHi4itJs4R6a1kqx3udKCz1p8Z0iRofIA1DQs
         s9QgKlvIzuLNI2Cg8vFGe0OLlOgw9/bDsInWDa6YoLMnVgjnxV7crMxjSDhlplgV6VMO
         TAthxaf5cZFRHqnZEcJsS+RQTNJp/hnuOwRsAgs+AQjvsVcVog+z+EIZHWTHri/0FE5N
         ceLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412179; x=1795016979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY/MYfFEjw2YFz6ONFSXVTOnks+S+fKlmAWumtYd/lg=;
        b=R0DbQngadm6YlRL5Na80G8p2EfhV6kVy5yjYByg7DSYD22puLMps/mmuS9C/8N9HK9
         qzniX+vxn71sB3tV1gUk55gOHCDdPGcHLccynO34O8pV52P2gketk125gejQW1sQgnpI
         mKHhwLuGUC92yYEXFB4DRUvoXakFQKkQdzvfDfRVnrFBHiLQyttoV3G0Vs3FHCMwYfjR
         vAaW59WGRpyYLjP6Eq3rhbyugYzfuCQ/qDe8Qd030o9e2pJCaEbmVPxT7tqeF9P0vsSM
         KsliWBh5GFu9n411uj/9hEYJkKPVpL9ve4dUdS2bX8D/EAxQGZMjrUhtvTKaEOfaNZ2p
         rgWA==
X-Forwarded-Encrypted: i=1; AL+hErFQ75vYrHJzHxCejfVM/d0+CvCKY11zvIsJGD7PjdXjrLshcj/yBaM/YvTcm76yQtQwy8PIj98=@lists.linux.dev
X-Gm-Message-State: APuU4Z/aobM4mIFOypbCElsWDSixn7WsiNruKSOi/IKP6E3HTjQYClNL
	Og7kPIAvwrj+o8pwYtIdh78K7lAWR210ZbrPzLdhHyem64fGzwIP0WXQ7MGqlXrZSVY=
X-Gm-Gg: AYBFou3GoAuToEFj27IX4vh+o9NSLpx8ikoT3aE0fFbAVhcopE8tsMxazxUU3Ckl8wo
	mc5dRZ8nrpNMYk0IFmFAlPGb/s0wWOFMedUtlljtQQSbdBop/2Uxole67PaBIaC0onU2jRpn9w3
	FNZqCDIKG6yA9FHflSpa6YDT6PBUb7LbeZAG59Cb4pBXgdhoXg5PrgCIPyYvrUbjTSPThIve/DL
	fBxHtR2ZQPJ9fdMHTdhE/Qu9LEZDPxuhLUfk5oKg/llNsI8Fd+3pacBT8ojJa9h+93LD3LBvQ45
	/Sli93JvaflpbAzVLDKFhLiVM3vqeJmFhhLTHSnGuYuwpF0yzYoMtdK8R8RN0LlcBq0vfFDSZm4
	1gZUbfkJu/xr+xuQTlvG/X+DGbV9Qzacexaad6kcyZvCZOAu25IL0yv0TMlAmFPJevLgWV50uJQ
	ogfs9yOWxuZP23bDTjy6G2Y9z843oWETrsspkFdnHHujFA/MYxwX8CUz1vgTO2INk4wzZ9FQKFg
	1SPffUOqvO8xrNbtd5+2b5m/5DwvkyILKHRPz0t+uPwyphG2PepGcRKrZr7FZ2Wd95k40e3rx5F
	ug0IlqXRF6uu9VH8ZndPEcnzv5Bi26o=
X-Received: by 2002:a05:6000:2411:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-499c7dfca0cmr4870811f8f.51.1794412179165;
        Wed, 11 Nov 2026 07:49:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm11265007f8f.39.2026.11.11.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:38 -0800 (PST)
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
Subject: [PATCH v7 06/17] printk: Prefer the console either via name or devname exclusively
Date: Wed, 11 Nov 2026 16:48:05 +0100
Message-ID: <20261111154816.71103-7-pmladek@suse.com>
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

The commit 7640f1a44eba ("printk: Add
match_devname_and_update_preferred_console()") added the possibility
to prefer a console driver via device name. The name of the console driver
gets assigned when the device gets initialized and it tries whether
it is eligible for a console.

The above mentioned commit ensures that __add_preferred_console() is called
at least with name or devname value. But it does not check whether
both are defined which is a nonsense.

Add the check and do not fail quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3ddbde5326d9..b139314eda70 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2561,6 +2561,12 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  * in register_console(). Finally, it enforces some rules:
  *
  *   1. Do not accept empty @name or @devname.
+ *
+ *   2. Either @name OR @devname are allowed. [*]
+ *
+ *  [*] A valid @name and @idx will get assigned for a devname later when
+ *	@devname matches during the device initialization, see
+ *	match_devname_and_update_preferred_console().
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2583,6 +2589,12 @@ static int add_or_update_preferred_console(unsigned int i,
 		return -EINVAL;
 	}
 
+	if (name && devname) {
+		pr_err("Adding a preferred console devname with a hard-coded console name: %s, %s\n",
+		       devname, name);
+		return -EINVAL;
+	}
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-- 
2.56.0

