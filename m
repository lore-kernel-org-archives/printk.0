Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985704;
	b=vTpHwqiwD7r3xYspNkLpZM1MmHr4YouBMx/5ryzRJjnshzw4QunCfbXPZ3szbLH9BftG
	 Rz6tKSCUhB4BhnD1RlOtN6ugy6Pzy5NpJOiwikLnf3wg5KegievqxrWhWiBoEKTihZwWK
	 B0r5zfRVytKcx5U3Tahmmq5swXocXljuQs/PdsqHA850izCYuVO5S0z3i9XcWnSyRS8AS
	 SBsupByGsI9WF02jDLsoVjlDqv2dAfCszejNQfJW+oSZnbR3nWzSUqYJhlQ+8vI6uG/CY
	 D2UlksnvlW1MviYEcgELLOMSs9Rc3fbceo+gkuT3O5oWpSdGjv4r7mga67eXNcXGa2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NlzrlyRl0YzBfNfAvNCQM9oSO8T32UYnCjBHGgv1B6g=;
	b=vAF8h1Q2VPFaDvjpJM8sbpUBlvHd6iPRrbjc/KrJpM+cA4jAcpVNwU9cHpoTkV3PKVU6
	 +XffKZkvuUmYc9rVTW6jlh5UeA/pL4lOpL9BydQcI5/NMOmkt41qsEaXa0nQuNgTihqRQ
	 0LPxgkzbxO+wIEbzASy8CkcQqMsF+KuEWmZZ+7Yq7hgzE/KHrItilqwFpduahdOy6dXxL
	 GLh/WB7tfWf0DJOBzJ2JMQJivtruDtZ8t81QKCDI2veMjJQSw/xx1q6+BXzeDKXx/GgeM
	 3QQyjvW9QIH/MhnO9dXKFENG6gaiXAX52IsEZ2/Yhw7hqvl1QXplV3btZhM2UbLvjaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NqsnrOP9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CB606A329
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722CB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NqsnrOP9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so8220435e9.2
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985703; x=1794590503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlzrlyRl0YzBfNfAvNCQM9oSO8T32UYnCjBHGgv1B6g=;
        b=NqsnrOP9lpZJ7AGr1dtmksUXXTTbqMVWGIRFq//qMbjt3csT8d03tY2Ov4VbzVxS9F
         ZL/OZI/Hv24bnHe4LwJSJQ8/Uck6VgKXnNkkl5SwyIvr5K9cyZIQkYOO8BH2zR2qKKNT
         LiBr4Qg7yFFsFcC62X8lzrJAGfeFBpSKMKFRHIFpBQdKUPMJ0+1tzZ+2BUY0yHnZRRtU
         GBnWkiIN3FxlK2TH3Txdj5JY+eQ/fhV6td19j9e3KE2qmlYhw/lxVaPcFvwRXijphYaJ
         FsAMZK7bn1fkM67dtoTwU5+2MrzczSTxPUNEtyvYGTfSvqkhyVKM+Bq8m/FHPrQer4Kg
         +t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985703; x=1794590503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlzrlyRl0YzBfNfAvNCQM9oSO8T32UYnCjBHGgv1B6g=;
        b=ssVC/jzrAgFeZL6lrQ5IDMIkeemQgW48ctTd8KTZKQ1o2jM9OzymMJvLl/HyeJBRPS
         Rme3QD3ql7XG+geHnKbO/w00sYg7oK92K9Fs7/lNB5pYUUpMdvMjml31JSRKKXjQHcRT
         fv9kasKpTaQdFZRAgInI4+2Px6tu5LStD6LJ0ioh8k5my79enn+lBEc5yc1VwCM1DbE1
         G0ZlErv6v2EmZ6AWWpj0EAOXfuHcBnag0M80ljYkrbQm5d1w12uXSTuLBY/ygXPoBvq3
         Wq2GaE9DoCXHwT9wYXaOkxZwECx8Z2b1/Dz+6kjSNJOvTE+i9AvzOtBtTdzs4V92bFC0
         37Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzUMLfaAJX5/T0tlir+R13uRP3OXsx1/FQlxvCtGi6ZmnC7uKil32wWJSnDCLO1BgEhwIJ7ixs=@lists.linux.dev
X-Gm-Message-State: APuU4Z87TaBsmabfyqIm2o9M8TO7FjtqVkFO8NacOwuaoovCGt+imYZl
	nWen9itc7p++w/PspaGP8Ke0w/Nt77TG8DWq5iTUFpYGOU0dK/Sxi5OP+aOhyoa+ba6wtd0lcXp
	j9yyyf4w=
X-Gm-Gg: AYBFou1IXAFJ/2Kn8+ar9N9qpp+qDvV9lnC0jWKqDbHnLqdWpfAhzQ81b1jwO0jEywg
	BTZhA5WJBFytMcJ+K6a3gTvbJ6E92hX/Hi0Cc4aCbfS4InvLJNk7Jugsorw1hQd0O9Kg6AsIhUY
	FvtZL8CiX355nXN3yFZ5ojAyx9JDxaa5BoQ+elerconxZSX/V/lNRSdc93m87u/IRt4di7kZBpn
	Ujg/cYRSHhpyi0Pz0LRXvokzId/awuNPvBcfu/Fas2HQoFpWlSrOzMZ3DcaMkNT6ockSQRF5/80
	Lu+LGG/D9uxRhoH24k+9ty4PSeB3rFtofLeeq8GCyAfeBCsYuQ9kL4QodieRK/NF8rxShRr59PH
	v8KIn8kLGbt1oan+RNItUvZSJdBuCkHhZNYMlK83A++QKRsCKzWX4S3clD+88oDpztLnhTEO7FQ
	2YpK4KeP96pyfk38r+4NH8FVssxCYCvb03WLh7Mq+Qp5LUYOAoXpr5yPrErK6A8BC0SvQD2k0Y+
	aF5CAhmR1xhvs+aZ0hBZ9nf0sz6EMgJT9/DbprCH4aRC5ln7+6oANVxHDzU/+VvWkQ38fFdHrI8
	EUPxXdNDFIzyfQRMJ0G1ms6Y9rXIpJ13l6oWc54CYWx417Kojk8I
X-Received: by 2002:a05:600c:1d0c:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b6df9beb91mr57513245e9.34.1793985702968;
        Fri, 06 Nov 2026 09:21:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76d83e539sm6714725e9.1.2026.11.06.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:42 -0800 (PST)
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
Subject: [PATCH v6 07/16] printk: Check that index is not defined when a console is preferred via devname
Date: Fri,  6 Nov 2026 18:19:43 +0100
Message-ID: <20261106171952.207909-8-pmladek@suse.com>
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

The current code makes sure that a valid index is defined when a console
is preferred via a name.

On the contrary, the index must not be defined when the console is
defined via a devname. The index will be defined later when the device
matches and gets registered.

Enforce the 2nd rule. Make the checks symmetric in the code.
Do not ignore the errors quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index d082169a8615..2c205c454321 100644
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
@@ -2589,15 +2589,6 @@ static int add_or_update_preferred_console(unsigned int i,
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
 
@@ -2611,12 +2602,24 @@ static int add_or_update_preferred_console(unsigned int i,
 			       devname, name);
 			return -EINVAL;
 		}
+		if (idx != -1) {
+			pr_err("Adding a preferred console devname with a hard-coded index: %s, %d\n",
+			       devname, idx);
+			return -EINVAL;
+		}
 
 		strscpy(pc->devname, devname);
 		pc->index = idx;
 	}
 
 	if (is_new_entry && name) {
+		/* A console name must be defined with a valid index. */
+		if (idx < 0) {
+			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
+			       name, idx);
+			return -EINVAL;
+		}
+
 		strscpy(pc->name, name);
 		pc->index = idx;
 	}
-- 
2.56.0

