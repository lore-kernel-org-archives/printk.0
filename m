Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524694;
	b=kMyi0XcTLZI+B0KRdzISCsjuArm1wRUUk6AfpzLkQrg79FOEjS1QGfjHZqtVSluq9A4L
	 ilUI6aIURPg2i2zbAg2no/4d5UPsrpvTsoXczXwyRJtfXG1DCe+5Dh27ActjibTz4edLk
	 W52VkuM+DZItcXlKxaXURCWVPKlMMOqeAgO8VsKSvo6nO8xTbV2x7gyZCNiFX8TK0Eiki
	 5VG2PGCGHRMvFWf651WLM709pZWzvrOGoboxQUKD5PTlnP1fdKjlhxASGQDhk5yx/agMd
	 NgNEgow1wySc/TFQa3GMl3h2nILKxib1VrMKkEpX7qebHnp0ep3NeG63EJo3Xb0LaAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=5r5JYQJqmNqN3r5lIyUf0H9f1ueTB1qr9DPZ7tuXyKRU0pXJWMQmusIjNA+4LI8ei4Dj
	 E+wbQY6Y13cLonYaJZXelm+FOaUEyX2Z9QGGqGckZEpDmzyWsdmgNYMMR8PZ7bTMzPVug
	 aoktHZL7XoNj9JWNg2QS36a8CNiOltAWp40Gjz0F7wuV0bGrklW6tTEkEupz1jWO3WLok
	 8QLaVWH8554dMqDfOFjwyiVtAPkTx8x5rDZ9ptPkrrDq4V7G9SCtotp665Xv8Z6w+VntG
	 s/2VKcJC6hHNMEyk/snOpjqxnfAHQfUPo+bgCywcLky9ppDKW9iNl8T7xnbbugqEYLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QfAKdMbs;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC8606A899
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 23:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DC8606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QfAKdMbs
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so4094605e9.1
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 15:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524693; x=1795129493; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=QfAKdMbsJJP5YdPQXOOqRrz3K+zj2lfE5QT2SXt5n4Is3m3B0aCGF2tV73KMvOr1BK
         i6wQLSgMYMIg+mUkE6bvThJ7XCDEUxCrNWhMB97wDR/kGqSMKKJQVgIkjvX0eJ6b0b6q
         Lh6ZmgWFN4OXvNwnRyhN9CZAbavjidIqm/foE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524693; x=1795129493;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=vehxW4KWLb4iySsO7mMtdbSnZYxJmfzHGNNqdAkLhe+UVZjr3hYcdes7noFxsbkRfp
         x6NdYjLDxu/uV1XWiV7h+/4lzfewYicLyarpeB00gDclffyawGko8pk3lzA4y/vpolNW
         S3voC4GBq8QfAiWgHuem28JTpEI78EgawTyrkf5ONScFRLgLqBDnfuVSZJJlWOjLyREi
         7Jy+TLeaanpqiyxvHsVd05GvBMjy+D30YCrGSUZi5WPyzrQIzWtDdkgoiKrcvL6HUkPp
         0McfrWHewe12U3Wp7fE1jMAGmAoc+MWwVzaizeLggSz9dKxpWKaG5ix8O2AmAGA30MUN
         zLKQ==
X-Forwarded-Encrypted: i=1; AL+hErG/OJKmVQH7mcktR49sTpfflNRajJ7rCeHCNWK0+cB5Lmf8ZjCmYr5Gkb35DjShERfgWZk73n0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Dp7vUCUa/zzJtpOOPx9zZqxgEFHWA2vGqCadmEEDswVnSj7DP
	EYKWHc0DYDSgFegwqDkcHf+8yixy8Jgg0TkDVzTH8k3wJcc08OkzZQ+wrc/Qo0tjiJU=
X-Gm-Gg: AYBFou0Yi3r44GHdVxlk3nlHvNKp3JDH8drHcMHRKpVf6BVC0+C/GeHnrosB0a5/cjE
	/iHSjXorzEOEl01pI/vEsEsq0rxO//24e1Wd+I1ZtscYTN7PVKNYvRhAij5IyoAJxFSsuyQYKV0
	46G5JsjdbAXb4KiugGAZIhJ+FAyMe3yAMRbnPiJ7tjKoJF9QgxIoiio25aWJ4ZC7jNeDvnTRHbI
	GIfG9VwcgKBNHnAAqanzUZxOiKer0UcKTw1zZYRxRPzboSLGNlDHUYHxhZDzr3wePB9j6Z3g1+z
	tJXfFTCS3XUk42aAawsph97ijrfE9bAOrKkIYUXcaVqMUkWGIgBPRwFSb4Bnzf9fk/S87D5w1B3
	yaYJW6DAkfeuGPc5nIxLryB6Yb8n1pZ04UB3H2D63g8XkKQwaNIwnxlfJHiIeEkBO2FdzqeQqVk
	vyZnDB/pVo/fcnHr6j2daNvT6aYvHgmdFZ4I0NQd2i6y/08+Gt8P9IsmCEf4brYrx7IFab6eT/w
	Hijyd9teaoQUsyUghQ/QF+9Lglv32ulUsVhtUUKHfgx+S6ZbQdnJ7Y3Pd5Iuv9EIbzJO6lp0+MG
	Z76LBG5sfk0Il26mD2U+5Oq2X/zKItOtU0bdcQdO4ii3DvsR+YMaP7t3uhMV6e+Kz98i/U0B7TK
	GUmw2v8ngUbWSSD88n5LICeCQHEBiOeDrGkyf5tUIZ2Krxy4vMaM5lf3RaZB4nCnagFU8CXghRx
	zipPvuWkKDObCao6R6eISKZXrnw8XIvD6xffnTFKFnB9Wacui+1zv0xqt/eKsS+SSAPWD/IAs3/
	AB+YBE=
X-Received: by 2002:a05:6000:2402:b0:493:8847:841e with SMTP id ffacd0b85a97d-49c6fd933b7mr1670741f8f.16.1794524692875;
        Thu, 12 Nov 2026 15:04:52 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm1589884f8f.36.2026.11.12.15.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:52 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/17] printk: Ensure consistent name and devname when updating preferred console
In-Reply-To: <20261111154816.71103-9-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-9-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150447.cd6d7098fc4dfe5b@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
