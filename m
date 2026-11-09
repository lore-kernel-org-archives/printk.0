Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233271;
	b=I74qpDUcvv5df7GlywDLh6l9uYmBus+KsCiXAk92E6CTVW9eUi6P/d4bhAWI+wgIpqvx
	 zLyuXdA9EiT1kXkm2KgVEW1lZ5sRH5gt6Sx1lW2t0hpUqcjcpzXuYSYjP0LTJ3jbvVsZb
	 xNmbutoAboXO5r6CbRJSCXvzzasPSnfFOzV6VEDuNx42CZqPSAcEBj3Br75s4LlE/LhvJ
	 UdC8w7ykOyJ/4aoA6rg3aa749pBVo8vvp5+yhnrlf+7TgJNe2W+5piXZtOEYQIi6HPrdm
	 tPzMD378kebiCBCfeZsuD90Zx2OSRu3HAyfDgDI557VJcxL/+ZokhNwpqZq0DnjOsow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eT4bdRXlL5MuHCPKrmFNmswIgZvSop2IFlmX/iKcvZc=;
	b=g1JZvhPRKyt/ZD6W6UTzgl7kThlXePMJG/fkrZayOt26yyWVASN1nSsya9pz3+PjR9/A
	 i8MiYa9NiG/WVqnykZIrML9EDKCznhefBLwzEnY1Pk7VHZg0hb7VDYZnoc4nGav38GFmc
	 avACban6+C4vZd0c5QFx3hqYKzdrBJPkDGfi4SK3elHY+vhnjDCrlWVsZuVYHewrt9hm/
	 8vLu21j67Zm9k9fHI3kKi/XbHpqYSoP56bv8ZdNkSbBmiNA7iHg6//bZPu4DylqhdgODo
	 u6xVkBhDLDPpepyOMaaqByd0puCBnNqsNpEF/5Lod1llMXwxictvY9nqyiBILdTzxXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P933eUB9;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A47606A33F
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 14:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A47606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P933eUB9
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922523d1afso496123f8f.0
        for <printk@lists.linux.dev>; Mon, 09 Nov 2026 06:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794233269; x=1794838069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eT4bdRXlL5MuHCPKrmFNmswIgZvSop2IFlmX/iKcvZc=;
        b=P933eUB9NtuK6NjZUaMEKnuiGCmtWi0o4dH1lTAAAFThJj5O1dH4Ei/gC48XMo1Vw9
         eftxfFN5HCJavRo17HO53AVQFMbgI3Q0p747HGtu8QKBED1eRgTw6zmb12iAdys1HZ6I
         YgS/nZngaqWR/cpvFWAat76Fi8ftQWFbwldhT0l/hgy2SObI40CNfL2SHECmtdNCXEXu
         I+bWG4gDYEmLNQ15Gl2+l0C1WuAr4y+ID8eU5pZQcd4DWHICAwhlNpMSxt1GKGj8rfJl
         TSIUSudlITH+AYLDzlo+8ZcbpFkXqqDNYTYpPLAqwDeQAiZOzjTiZUmSzC26R/Bl42+s
         ptqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233269; x=1794838069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eT4bdRXlL5MuHCPKrmFNmswIgZvSop2IFlmX/iKcvZc=;
        b=uASVitUFMmUAvD7mgjbTFVN2FH/a7pqJC+3U5LViHo3QOIVIAWlx+UWtRFHfl/8C9x
         7K8waFHIt3+F/6aRurvotg6ltsU6aez9N7JmPOGiX/9jSkSzDptHCv2U8utRq1sJ0tj5
         zTdh2wgBDj+ndMwHTMzgBxq8idxDyu6PXBHQogXHxQDh5AhOahqrXdx/JzbMYr475RtH
         H3uRdwGM35cmNbQvNbcA8NOEvBU7XHRdx/9EVqFVxxiOAjipM4Mn2y/cIsLmZ3qP5eAD
         2OaaKPXtpsZ7J9kYkiSrtKgIn1OeM/1R/hsxX70MqYGwtxAIZCsW/Mr/gZ/uJVsufP83
         b5qQ==
X-Forwarded-Encrypted: i=1; AL+hErEK8ggLueVcGmSRaghTyxx7O8Iied6rI2lT5Go8Zthulynal3KPLbcE63U4LDq8tELeYd2zM0Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z9YhoDNLTs/MwkSSO1F3uwslqNAcrKOomrron9z22ecNJ2Q2VJ6
	I/jWodTAkSemJEr8f0jCMjdQiro6wflPhU/1Zp65eV/NwACOA8Yey/+UXoo9xmtdKbSpLn5EcDk
	0BVFTY2c=
X-Gm-Gg: AYBFou3prfjJ6wjLl6pmgtum/EHcoofwHNs+wyf/M1GPP/X334YJ2t6ZqA2teC57XCJ
	2b+4jVVp3ZbNOwmDsRfEJmTX3CPSIpWG6nupM8P+vLId1Wj/F2LQQaSrrJLsMz1XHhMpNii+GdC
	C1Dhnz6FU8nBbwQTyH1yxl00qmAV/IUbVpbbGUrIr2tGGALang42vEWFn8FTWWZ5rh5/frUHpCG
	Fks39eimovqxHjQL9bmz/RM9LtPEIwvOJbtvEF1LF2AvsvwqLaxQ9MIs47X5dSYQQJQDHazFhvJ
	528I5X7ZGRGdp6DBXeDy1J4lfTXOuaT2bqfihfXm5tNORpmI/Ao+JnhsS7B0aRxjgl2yAcN35bk
	QjzRz7nfFBHX+acWIoPx6YtY/Brp+hfvNp3Ygzaqu3V0qqxEAh1VA3S3M3dHNrNHwclWGvdKO8G
	hs67EanowHqHUH4jX7O0pnODFcE2YjN/S/H69n98d4KkmHz4OXWxsJhVvMfMnyWRWuXrQZGgtM1
	LwytjjeQ/zBk6CC095NqYuEO6TcB0ycxkKiAeguHE2eNBlHtNHZZIJG8ffo76tKy+lCJlM0ivoA
	1NJh/g387TK6M+f8qPI797YrnsjEiQ==
X-Received: by 2002:a05:600c:314f:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4b963c73aa2mr82442825e9.25.1794233269198;
        Mon, 09 Nov 2026 06:07:49 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm384506925e9.0.2026.11.09.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:07:48 -0800 (PST)
Date: Mon, 9 Nov 2026 15:07:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 08/16] printk: Ensure consistent name and devname when
 updating preferred console
Message-ID: <avHTsnRan9cALOEu@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-9-pmladek@suse.com>
 <sashiko-outbox-201951@kernel.org>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-201951@kernel.org>

On Fri 2026-11-06 17:37:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] printk: cross-type update corrupts entry in
>   add_or_update_preferred_console()
> --
> 
> commit dac2f22b5af57f05f13a7369b2af922602449749
> Author: Petr Mladek <pmladek@suse.com>
> 
> printk: Ensure consistent name and devname when updating preferred console
> 
> This commit adds validation in add_or_update_preferred_console() to check
> that existing preferred console entries match the provided devname or
> name and index when updated.
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 26fab79c32c4b..ba644a0650910 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
> >   *
> >   *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
> >   *
> > + *   3. Only matching entries can be updated.
> > + *
> >   *  [*] A valid @name and @idx will get assigned for a devname later when
> >   *	@devname matches during the device initialization, see
> >   *	match_devname_and_update_preferred_console().
> > @@ -2589,10 +2591,7 @@ static int add_or_update_preferred_console(unsigned int i,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (!pc->name[0] && !pc->devname[0])
> > -		is_new_entry = true;
> > -
> > -	if (is_new_entry && devname) {
> > +	if (devname) {
> >  		/*
> >  		 * A valid console name and index will get assigned when
> >  		 * a matching device gets registered.
> > @@ -2608,11 +2607,18 @@ static int add_or_update_preferred_console(unsigned int i,
> >  			return -EINVAL;
> >  		}
> >  
> > -		strscpy(pc->devname, devname);
> > -		pc->index = idx;
> > +		if (!pc->devname[0]) {
> > +			is_new_entry = true;
> > +			strscpy(pc->devname, devname);
> > +			pc->index = idx;
> > +		} else if (strcmp(pc->devname, devname) != 0) {
> > +			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
> > +			       pc->devname, devname);
> > +			return -EINVAL;
> > +		}
> >  	}
> >  
> > -	if (is_new_entry && name) {
> > +	if (name) {
> >  		/* A console name must be defined with a valid index. */
> >  		if (idx < 0) {
> >  			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
> > @@ -2620,8 +2626,15 @@ static int add_or_update_preferred_console(unsigned int i,
> >  			return -EINVAL;
> >  		}
> >  
> > -		strscpy(pc->name, name);
> > -		pc->index = idx;
> > +		if (!pc->name[0]) {
> > +			is_new_entry = true;
> > +			strscpy(pc->name, name);
> > +			pc->index = idx;
> > +		} else if (strcmp(pc->name, name) != 0 || pc->index != idx) {
> > +			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
> > +			       pc->name, pc->index, name, idx);
> > +			return -EINVAL;
> > +		}
> >  	}
> 
> [Severity: Low]
> As reported by Chris Down on v5 [1], does replacing the combined
> (!pc->name[0] && !pc->devname[0]) check with separate !pc->devname[0] and
> !pc->name[0] checks allow a cross-type update on an occupied slot to
> corrupt the entry instead of returning -EINVAL?
> 
> If preferred_consoles[i] was added by name (so pc->name[0] is set and
> pc->devname[0] is empty) and add_or_update_preferred_console() is called
> on that slot with a devname, !pc->devname[0] is true.  It treats the
> existing entry as new, sets pc->index to -1 while pc->name remains set,
> and overwrites pc->options and braille options.  The reverse also happens
> when a name update hits an unresolved devname entry where !pc->name[0] is
> still true.
> 
> Keeping is_new_entry = (!pc->name[0] && !pc->devname[0]) and checking
> if (is_new_entry) before the strcmp() branches would reject both
> mismatched updates with -EINVAL.
> 
> [1] https://lore.kernel.org/r/auLxQDWkHLV01D1t@chrisdown.name

This problem currently does not exist because there is only one
caller in __add_preferred_console(). And it calls this function
only when "name+idx" or "devname" matched. And only "name+idx"
or "devname" could be defined.

Well, this patch is supposed to add paranoid checks to make sure
that it is called correctly. So, we should catch these cross-update.
I would add two more checks:

--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2606,6 +2606,11 @@ static int add_or_update_preferred_console(unsigned int i,
 			       devname, idx);
 			return -EINVAL;
 		}
+		if (pc->name[0]) {
+			pr_err("Updating a preferred console via devname when name is already assigned: %s, %d for %s%d\n",
+			       devname, idx, pc->name, pc->index);
+			return -EINVAL;
+		}
 
 		if (!pc->devname[0]) {
 			is_new_entry = true;
@@ -2625,6 +2630,15 @@ static int add_or_update_preferred_console(unsigned int i,
 			       name, idx);
 			return -EINVAL;
 		}
+		/*
+		 * The name should get assinged when matching the devname, see
+		 * match_devname_and_update_preferred_console().
+		 */
+		if (pc->devname[0]) {
+			pr_err("Updating a preferred console via name when it was preferred via devname: %s%d for %s, %d\n",
+			       name, idx, pc->devname, pc->index);
+			return -EINVAL;
+		}
 
 		if (!pc->name[0]) {
 			is_new_entry = true;

I'll do it in v7 unless anyone comes with a better solution.

Best Regards,
Petr
