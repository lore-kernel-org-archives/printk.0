Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985693;
	b=CtLQ5tiJd+3L6f6IZ/nernJBTqoYy+A/gUC2kae7YVFIS1MRcpzBgU09sYqs4N+tMkW2
	 Hg2F9cpXLTuy1aF+0lXpU7QZ0hwt6o/iSNpRdqbAeSgsl7/8FCb/40NWpj3IwqnqpxIJ6
	 WqhlbmTyf305BZzaJX4B889CT15Rfne0hCeG6Sx/+Ffgtil39Adzq1WvpKP55V/DzRo5Q
	 NRiMQ/jstAg+4ilPidGam2pw/rwp1l7ngqE6njEiHcB8pvlqyBPQ45fBY/sOK8Iiv9OCn
	 k6I/5VXnmVPRNG3z6IHM5fTNYFkLQdFB1TtQbFAiIpyuoAr18Terw8AaAlPcQC0ymdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNbq2rk41FUTgdli5n1bqp7QxFkeC+oD6L0hTPhyCB4=;
	b=A3BVLZjzkfIVGYMsEcwRnIDL8cxkMfu1Ja6lQ08bff7biquxbeGs9lsK9GIawYuJTQkY
	 eWh7iS+ioMfZgFAJ02AgMfc9CJDhAGA5OaNtV2P1oiD9iZWU7znJ7msHYcFOv5O3P//+p
	 Ye4OAaKZghH3eAMFt71nHmnCmiR/sIcNLDFUWZhSG4RWo4Axa5X0TtEY86zKre9X5s5Mq
	 9Qvqkh99kXurJYGbe1LzF6T0Jt7sYwWeNvYJAwbYPasJ27FsIglfguvLKsEQgnndtB8Ef
	 PHw8cCS9TPmgm30sW4mPUo/B3b6+f0ofWrUoDN8nlIaEFa1/RzDzn1plGppYzS7OlHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EnMG5UC6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1885606D818
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1885606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EnMG5UC6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6998415e9.0
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985691; x=1794590491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNbq2rk41FUTgdli5n1bqp7QxFkeC+oD6L0hTPhyCB4=;
        b=EnMG5UC6yw7L3vuCsWhOOS+iqncJjk6NZZCHMh5ImngeJ73NpF0vRA83vvjyuNRtAx
         gnZzp23pdUJ7hGeGQfh1OV8z7yfe+mkdzaqs0Qihm5WcGObzUINecVK7G3GWOsSPYkNM
         XojZSAvcAwkjDoEgMZx7X+A24O45lL2FZrhbDMt7LJghcD4lRUGS9ryDTBnIEUydolPP
         tcXT0DcUz6zqJTOgSW7WuUx2LUTYiWXfx3OWX8k73MILZLuJ0uaJDn7YZHJq79FXm6M/
         M3R5hq8flGtYLXYbRlq09l/697Z9grZsdkoh4ET3Mhg/O3V50qgAnULwi88G3ggX3ekb
         +vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985691; x=1794590491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNbq2rk41FUTgdli5n1bqp7QxFkeC+oD6L0hTPhyCB4=;
        b=D4sUkkH/Y9qaUM4VAGualjGJwgFd5D3M9AXGEc0BhbKT1Fyw7TzCpWyfiCI0rSXGN4
         Y9etcSbGHwe4d6Xck453r0rfcVnkcSh1fojMBRSYx8Ry2QxM93fv/S0171sokp5iEO49
         YRxQK9HIuaUv0/vs6M5Rz8T5mmpfmZkR3T6Yox44hcQJuBWJZgY/InAFrwFFSee08FDY
         fJGcrD5PH9t+U0yFjhdpBbs86UvaxajwL89xQKjwbhKZHnnWvY/gMdCvc1+mYfg9bkRX
         83HwgyEOpV+GBnMVrC4s82bocSV4BBrZqZA62YsTeFrgjp/b952lBYItIWYJ/yX53UFH
         Y7qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA+01zKOWmX2v/glbk97nRetY+V05bs7OkGxar0GSHY/CW23LIWj5pE3kZKDyZDcLYNf/0Jfc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/UWF2hAExOH6siNgUsnQ/zwCirdIYe7/xjI71FrM4RZhPj/VDQ
	6KnRWEYJjoypxXry+bMWB1xH/m7crc0K1zrCji21t55xU4Z93CzYRKS//lfitYFwJjs=
X-Gm-Gg: AYBFou2muljDlHd1w+gYje2zMe97yx8GVXEquw9oWTDWL8GfmWIB3xPltB6255axv4P
	oCVwFyau6SOiynkdFnTCFvCTaY4MPsNe60Kb2PtsQcdurTqRyGt/dvVKU5ggLR3TYaiLv8VxWlv
	OzozEfTh1GkKywHhf1KzKmkitqkB0vSWaFFRQUYel/+0ymr5VxYwAdwrgZB3PIlj7yzoNGWXs9I
	IVSqKIsWkfY42J/YtLarxUOJUCWQu5eLIDumBeTMQsiT4YPdH0NBrO37BvnUwgz0ZKoUcrADgsU
	1dMfJoJUdTWdpeJdGYj9VyepB6a45gwR0YV2eff9ZFguS1+d3SvOdPReOb9WcOZa0L3fvEozVTE
	CAmoQOvuexA0aP83XCCDoa+CrV3pLy8fViZhUJWy3SOs/7AsnYvyDZ0s1DE8iyW3aMmRI/zfx0n
	0VE3byY9lkCsUg/p6WIepggd/oaejEzUiHcnjwyjGR1PFy5XA+NlNB8TSoBiNXBjBZ6wwEWt5Uc
	8n/br99wTi2FhbHF2AUyWBpqJvVefPtQ/MBAt3vyLegol8L9nNchvn7COkoogPaMCcxKa2hpy2p
	C76EmTXNhjt+ol62BCzkA34XzIg6oSA4
X-Received: by 2002:a05:600c:8885:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4b6e007bf2emr45387165e9.29.1793985691171;
        Fri, 06 Nov 2026 09:21:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm86878005e9.15.2026.11.06.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:30 -0800 (PST)
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
Subject: [PATCH v6 06/16] printk: Prefer the console either via name or devname exclusively
Date: Fri,  6 Nov 2026 18:19:42 +0100
Message-ID: <20261106171952.207909-7-pmladek@suse.com>
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

The commit 7640f1a44eba ("printk: Add
match_devname_and_update_preferred_console()") added the possibility
to prefer a console driver via device name. The name of the console driver
gets assigned when the device gets initialized and it tries whether
it is eligible for a console.

The above mentioned commit ensures that __add_preferred_console() is called
at least with name or devname value. But it does not check whether
both are defined which is a nonsense.

Add the check and do not fail quietly. Also shuffle the code a bit
to make it ready for adding more checks.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6bba67e142e1..d082169a8615 100644
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
@@ -2595,11 +2601,23 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!pc->name[0] && !pc->devname[0])
 		is_new_entry = true;
 
-	if (is_new_entry) {
-		if (devname)
-			strscpy(pc->devname, devname);
-		if (name)
-			strscpy(pc->name, name);
+	if (is_new_entry && devname) {
+		/*
+		 * A valid console name and index will get assigned when
+		 * a matching device gets registered.
+		 */
+		if (name) {
+			pr_err("Adding a preferred console devname with a hard-coded console name: %s, %s\n",
+			       devname, name);
+			return -EINVAL;
+		}
+
+		strscpy(pc->devname, devname);
+		pc->index = idx;
+	}
+
+	if (is_new_entry && name) {
+		strscpy(pc->name, name);
 		pc->index = idx;
 	}
 
-- 
2.56.0

