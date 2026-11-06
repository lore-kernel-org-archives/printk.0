Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985739;
	b=A5Hrm+GL7r4y0VwZdVh/aGW8d4Ux31IQcrijURQMYFsVZXBB6sQbJKwajIrqWD1sicRa
	 /Noz21fIhmbCXaahSjXso/STQtSQrdxPWBbfBIIW8DqbWmqJO5lm3tRYWVVSSsHLfUbug
	 m4WbTdbPajRgbk2gTRq69luUdalh+OwIaq2/QkeSQRChRQamyKwC3nhFo+31DhV2av3rn
	 FPm/wurAA8io8tGaSWCIQTnKjsL9wYmDPWi3HKnTB+6aJY4mfM+8JeItyzi8KNtqWV3yB
	 z9e2YxjKVre44qm9Ytvy61vuOP55n17BCksP+qW7EiGbLQ25x1k4zW1rg7ofd2wpAog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XXKcqZDk+pXy0MzkP8tHfD/BYEj0adOZiSt1qNjNBeo=;
	b=VAIDn9boW9F1vak4DgvBjcJMA3sLsL4pNS1bDEP8KS01V9pweofNw73kng3BtlMnHG1R
	 LoV5VgxUEdxK8eqIOGd6UJ+uoJ45MxxgTwvN1UImvaNJnZbT2ASkyRVbYTTS2/TamVF3N
	 pYXm+8xLelGKDC4P4+RJjS6ZI9b/aLE6Q3xaEP30VVGf9p2gNJaUcy9IhD58YdZRoT+W4
	 yWJ9wlupDl6Zojhzhy1/gpBCU9YXaE+lsxicmPFzdaMLuf6RIhHgz3XppeCFauwYMvbs+
	 qn40Bo535Ue+YNCES4EgTFDIEf4iVJ4PCZ+Hz7Qe08bK7ZGOO9MR7O71Zoqeuu8BFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Egp7vCFt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67880606A32C
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67880606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Egp7vCFt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8796155e9.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985738; x=1794590538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXKcqZDk+pXy0MzkP8tHfD/BYEj0adOZiSt1qNjNBeo=;
        b=Egp7vCFtdWAbcWInbqO7MAs2YKveCtG3UoMOTQnc9f1oRHyu7LEUdjvHqakXZWLLYr
         fAdggplNjLKeN2mMT0MKeGQ5A+Fvtgt6R7H4ZDI+UlBb1A0b5Hi+TMQGuWPskRzyaxGN
         fL/NMXJTpCNP5EH2++8X/9axHoGAiC+1JIASZKBluzAfNLX3D0X1mD1djjov7S6awNAy
         GD0K9uhzYH3HgxXLdWqIuVEASRktCnVM4/8UcnBHQz+4+xVrD5lWVL6K+kSPA70hObp6
         hginnYRSV9Qo4Y+LhpUlBnCeknddPXYK6n595qq5gpo6wkfLd0ejU6eCF0BvHMUMjh+m
         jwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985738; x=1794590538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXKcqZDk+pXy0MzkP8tHfD/BYEj0adOZiSt1qNjNBeo=;
        b=IWpici6seTRIAQ341bJH6pVkyQh45N2vsXaiOTb3EP/JwBVBGSCGsJC+kE5JJy8GfQ
         IeukDh3MVOFiL/zLeWpAU78Rmw50gzEfeks3A4GQHhDRxWlzF9D+nkjoZP16rt9xjvSU
         njG93QH8yyNOJYNIqAPgT9n6FLIRNWDjI0hfWry5kL67O2G1kxPYTosLppWHB6d0UEaI
         UisdDhsKIsx+44ovoCPjgg7lrHD8tn6ddNzWmo15u6c4B4vs6Ud9T4hOZBi3c1/od/9x
         Ai2k750mmWiWJL51JDCu3stc9l8MdVgF/T0CTwyeUM2z78uODwv+dk0cTeRqHN3Uv3mh
         8NZw==
X-Forwarded-Encrypted: i=1; AKwUvBzPcHFiOCmRra/AfFQScnOSsHMShn250haH8KKlE6Yipe2fEmOsC47U64KwJ5ofpnmE572I2Es=@lists.linux.dev
X-Gm-Message-State: APuU4Z/jhs7AlTfqMjhTzbPTNkZt/oTz0Fx/DGq47xDicxFuhp82W1Bs
	yC/VE5X66ki2xkDGelnUpGoi8+fp1GPgLrmSbgT0fsGKDNoJLpBUzoU3XHAEhjnsNmmJNQ7EZw4
	IUDa12HE=
X-Gm-Gg: AYBFou2Smn4P6zGjjZQiOCvMwiwmxO4ddsmYse89ZNxgQoCGkVUSeJDPaSOPeGebobQ
	0opghQ9pRsoaz6Rxff3vAbrekw9JcrwA2smMiFhateLaP0XWXVTTWREfa+D/1RXpYXlogdyeiKu
	X55OjiV8HzNzdNzQKQ3PO7M2hhiM7rhKMthBLbD5RH9deFsWpHHl6r4/qvt6u8232VYFUPjHhmF
	mhd+w+5fP1faibJPgxYoibZ16q9mYwh8LhJ58L7dxSDJ/3L+pctT6RltIqNMDev9WYeXAF6PGZh
	UlKUSPPvctkUGVc2/NatekuHNNE4rMTe2HCGUI10iQfIJ5lRlQtNi9HF42UvsWQqu7XT3KFR4T5
	ZJEhFbTZn2AZ4U2tXPG02edafZCamZleN2x/Fg8wc+itHEFmb02Fy5r+GYqXSB0wsfmMM5lsHhA
	ZZFXZ1kn+sfw4azMpApnS3ez+JPrE5iqf7y3phgLi/S7pksOndO/dYWwmAvWNHjYfRh7cfbo4eG
	K1jRJ329HbuL11lyKQ/1TRrO9oOt746TL7bC4B62W2mX1ytTmbDqVigXRDIAlWJ+xD/djqy7BTR
	j0RfG1OXJV7wPBTdMRdruTvoKvsCveg=
X-Received: by 2002:a05:600c:19d3:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4b6e0269264mr56193085e9.33.1793985737841;
        Fri, 06 Nov 2026 09:22:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm4738510f8f.46.2026.11.06.09.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:17 -0800 (PST)
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
Subject: [PATCH v6 10/16] printk: Allow to debug misuse of add_or_update_preferred_console()
Date: Fri,  6 Nov 2026 18:19:46 +0100
Message-ID: <20261106171952.207909-11-pmladek@suse.com>
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

__add_preferred_console() should always be called only when either @name
or @devname is defined. Allow to debug the case when they are misused.

Use WARN_ON() because it is rather an implementation problem, it should
never happen. Also the consoles are typically added during boot so this
should not panic a running system even when panic_on_warn is enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1eb542a321a5..49c5624eede0 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2585,7 +2585,7 @@ static int add_or_update_preferred_console(unsigned int i,
 
 	pc = &preferred_consoles[i];
 
-	if (!name && !devname)
+	if (WARN_ON(!name && !devname))
 		return -EINVAL;
 
 	if ((name && !name[0]) || (devname && !devname[0])) {
-- 
2.56.0

