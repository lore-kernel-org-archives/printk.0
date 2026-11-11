Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412205;
	b=3SqebFPXrXtqmJq+9mtJEbcG8keFRq8dra4Y98bgD6iUKYqL8O7087n1Bg0BwtFpESM2
	 J4cjNjgh+Acqd9Yw8fhN9gmLkWsx8XZEzDD89Ib43ADnMSqV4YlWn0pG/RIJMQ9LAnpH2
	 J3qXwdo33W2x5Av0IHbxaVeQrgnOJ7uyxOgHbXwc54KSkViXw9moK5IWzSxaYY6uPdDni
	 cPj2HpruC4m9WG7JKVNSt48RXFfUJy7fOemdmIHu0FGbbLKqLOVxEr9niG12rmwX0sENi
	 SrsBj/CMhoRU8CXoZowsWXPHoU8HF11K5v9aD0r4Eq2MZyM8yl+/DfPVLQrI9O5lRaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LjprsTIjzsSPfIO3HONHEzJmWX4QP7RVrqKdoKbxbaA=;
	b=w3c5WicNXDwJhAGxfsKOWlC/O93NugvL+Y2vSZ8WVdk6N9whdHqC4NlyqpoR2lJJMzGN
	 19qUNWCiq8Bi162BK/T5MldnwI1uRxXLTs1zS8Ns3QpWzucUF8dG8clKMFkvC6aZrnu1p
	 v8OtCBWdvNQTmVDbOpMXme5yYnbUT6cPAnaoDtLwGpCZgmXck4OPWTX6yDhPpq9EIQg8k
	 xaWf/oboRHwsC9IQdHNJkdLGEzY0R9o9oYP0GYlbSFaQMJ4y9OHM+haMVP0KEzn8Cl0Dd
	 Rl+xavYvA+8wnQh1v1Qri0C0HS0HNZHyutfA1HLLYjKBjl1RxbsSBI78WdG3co3ih5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AoJfA5EX;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B7606A326
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AoJfA5EX
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1998859f8f.2
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412203; x=1795017003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjprsTIjzsSPfIO3HONHEzJmWX4QP7RVrqKdoKbxbaA=;
        b=AoJfA5EXy7eMGvhQNJ47k1XTEp3nizg3fJcErz3+lZWMkw0yjYQDnAUo1Iw91NyLo5
         /YVIooIrp6EemmtJLyZ6abeHNUQhPeaRWgiGjFSWGimAL4HocVHhhNY5gRVmW3r5Ph81
         M1HdSE+6PNnRphTDD6oIMYzdlTReroDmuLxVhzOUsNpvyKLasjrYSqoNHBS/wJmUIn61
         SUHSFysP3kkGxTyYUXZtyeBRjz3YjzQmOvf6mMC3OLHzLKCkvLB/o+MowGDjtZTAQ4Bn
         YooX+5r9Aw3OmQdpHaAjpgwjezuzdnJVmM9xdcjdH9ZXhmhWjrWOdW2D/RvtLlTm7/em
         IFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412203; x=1795017003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjprsTIjzsSPfIO3HONHEzJmWX4QP7RVrqKdoKbxbaA=;
        b=qEd0dW4qRNNvvPs4iwgrfLg8cq8CKMUhfTGHCJnvcJDMwIIGNabhbq6MdJoNx6hE7s
         hMV81u8+z5cFhqtS2GGkC7if85vsl6cRg6+XE1wsok6a8oflS0qBlI4NAbNi4a7aY/Qn
         uYtZUOTj5l1A+nDJDz1l2wXdQSY2saVh/1dt4m9iy/Km8kzI+dLMcD5WGTvH6Rb1nFCE
         fOC4lEPFjD9npoQYsEpSMtb3M2jDzrsVRiTSMER9fiaVqdeFlY3qwUnBHrbY4ZVULL5c
         hm2hCMgK5358V+ISJqr2Yev0YfqHbp0SKUjt2Ul1PcEYDFXdagywCckYWdsNP+ydzXcy
         ashw==
X-Forwarded-Encrypted: i=1; AL+hErHy0D8zeBiOIC0S0aoYO4WGIRSrbRAbFqVhynYGPRYr0+1vf6q1EuwdHNIKI3qvqAR38pQ89NE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8XnmnsK5kYqbPBereEWqyveVwxdj1n5T/+N6Uv1Y0yJOh6KfbK
	y9vllOVg29pdPvDeNfljz3yYYHAozQT/telI/r0YNocgL0xYmLDf/MixH8obtCQAKko=
X-Gm-Gg: AYBFou3cbdS17E6aJfXfKZZH/yc1e7pHXlJxGn5f6TXyzFzCg6qxPL8p7lO47eMeJFm
	vxwBZ+kcmL8eYwdSLJV5iwHeaSZrWQuMdjThvK2Cx0yEOLvyVa5oBRyWdTl1YuNTxTsvCVtmbia
	qQAv6AfNeBojaBS+2aC/ExgkVMZVhn+w2Ivn55Uq0FNg0mAid9oUucqGwCJHa6FoC+Pm7aC8XLc
	MeYpZhkT205LRCsXIYHPhMd6uMfju7PWmyrCn33CS18YcufRAC3FoH+N63hxokiu5ITgBa0+7Oq
	9uoj5HXeJ/n5PaMCjyVKSWx4GJEn7gzOT+OFjGxOzmqpZ68lijd74qQBnqFgbuJbXGeY1zcASlZ
	J0qF+VKAABMG55xwUf/oFr6X58ML5fJx/B/PGpE3nFYoOMdWbONE3VcycPQ0Vt+0X2UB8WBC9RO
	u3kXjDqbw2omxBgeFoEZDhr8N1IW/W98AwEV7j0t/vH0ssdmqThzRx2RptlvT2DlbkUwu1IsqDN
	NcXIh/34p7RzpiI8/jEVjKaNsmR5JCg2fFfBZnmNE0cBD3c8IJq0K9eEJQSesczmztWKODP10zG
	rUChvWUw+yUTm6IBDbiqQ8Z6GegUT+U=
X-Received: by 2002:a05:6000:2c0b:b0:498:42e3:3f6f with SMTP id ffacd0b85a97d-499c38bcf11mr5126601f8f.5.1794412203238;
        Wed, 11 Nov 2026 07:50:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12466493f8f.52.2026.11.11.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:02 -0800 (PST)
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
Subject: [PATCH v7 08/17] printk: Ensure consistent name and devname when updating preferred console
Date: Wed, 11 Nov 2026 16:48:07 +0100
Message-ID: <20261111154816.71103-9-pmladek@suse.com>
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

Make sure that add_or_update_preferred_console() updates the right entry.

The current caller does the right thing. The new paranoid checks prevent
a potential misuse of the API in the future.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a76f37c1b431..e9b189eae548 100644
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
@@ -2623,6 +2625,19 @@ static int add_or_update_preferred_console(unsigned int i,
 		}
 
 		pc->index = idx;
+	} else {
+		/* Make sure that only matching entries are updated. */
+		if (name && (strcmp(pc->name, name) || (pc->index != idx))) {
+			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
+			       pc->name, pc->index, name, idx);
+			return -EINVAL;
+		}
+
+		if (devname && strcmp(pc->devname, devname)) {
+			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
+			       pc->devname, devname);
+			return -EINVAL;
+		}
 	}
 
 	/*
-- 
2.56.0

